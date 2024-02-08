import 'package:di_mana_aja/data/model/course_model.dart';

import '../../../di/registered_injection.dart';
import '../../model/chapter_model.dart';
import 'sign_in_remote_datasource.dart';

abstract class CourseRemoteDataSource {
  Future<List<ChapterModel>> getChapters({required int chapterId});
  Future<CourseModel> getCourse({required int courseId});
}

class CourseRemoteDataSourceImpl implements CourseRemoteDataSource {
  @override
  Future<List<ChapterModel>> getChapters({required int chapterId}) async {
    try {
      final response = await sl<SupabaseClient>()
          .from('chapters')
          .select('id, title, content_focus_key!inner(focus_key)')
          .eq('course_id', chapterId);

      final courseList =
          response.map((chapters) => ChapterModel.fromMap(chapters)).toList();
      return courseList;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<CourseModel> getCourse({required int courseId}) async {
    try {
      final response = await sl<SupabaseClient>()
          .rpc('get_course_by_id', params: {'p_course_id': 1}).single();

      final course = CourseModel.fromMap(response);
      return course;
    } catch (e) {
      rethrow;
    }
  }
}
