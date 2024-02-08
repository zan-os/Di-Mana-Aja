import 'package:di_mana_aja/domain/entities/course_entity.dart';

import '../../domain/entities/chapter_entity.dart';
import '../../domain/repository/course_repository.dart';
import '../datasource/remote/course_remote_datasource.dart';

class CourseRepositoryImpl implements CourseRepository {
  final CourseRemoteDataSource _remoteDataSource;

  CourseRepositoryImpl({required CourseRemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;

  @override
  Future<List<ChapterEntity>> getChapters({required int chapterId}) async {
    try {
      final chapterModel =
          await _remoteDataSource.getChapters(chapterId: chapterId);

      final chapterList = chapterModel
          .map((chapter) => ChapterEntity.fromModel(chapter))
          .toList();

      return chapterList;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<CourseEntity> getCourse({required int courseId}) async {
    try {
      final courseModel = await _remoteDataSource.getCourse(courseId: courseId);

      final chapterList = CourseEntity.toEntity(courseModel);

      return chapterList;
    } catch (e) {
      rethrow;
    }
  }
}
