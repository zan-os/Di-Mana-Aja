import '../../../registered_injection.dart';
import '../../model/chapter_model.dart';
import 'sign_in_remote_datasource.dart';

abstract class CourseRemoteDataSource {
  Future<List<ChapterModel>> getChapters({required int chapterId});
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
}
