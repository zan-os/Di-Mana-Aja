import 'package:di_mana_aja/data/model/course_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../registered_injection.dart';

abstract class HomeRemoteDataSource {
  Future<List<CourseModel>> getCourses();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  @override
  Future<List<CourseModel>> getCourses() async {
    try {
      final response = await sl<SupabaseClient>().from('course').select();
      final courseList =
          response.map((course) => CourseModel.fromMap(course)).toList();
      return courseList;
    } catch (e) {
      rethrow;
    }
  }
}
