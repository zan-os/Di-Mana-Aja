import 'package:di_mana_aja/features/course/data/datasource/remote/course_remote_datasource.dart';
import 'package:di_mana_aja/features/course/domain/entities/chapter_entity.dart';

import '../../domain/repository/course_repository.dart';

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
}
