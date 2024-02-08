import 'package:di_mana_aja/domain/entities/course_entity.dart';

import '../entities/chapter_entity.dart';

abstract class CourseRepository {
  Future<List<ChapterEntity>> getChapters({required int chapterId});
  Future<CourseEntity> getCourse({required int courseId});
}
