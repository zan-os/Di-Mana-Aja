import '../entities/chapter_entity.dart';

abstract class CourseRepository {
  Future<List<ChapterEntity>> getChapters({required int chapterId});
}
