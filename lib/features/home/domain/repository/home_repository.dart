import 'package:di_mana_aja/features/home/domain/entities/course_entity.dart';

abstract class HomeRepository {
  Future<List<CourseEntity>> getCourses();
}
