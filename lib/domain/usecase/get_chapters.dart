import 'package:di_mana_aja/core/usecase/base_usecase.dart';

import '../entities/chapter_entity.dart';
import '../repository/course_repository.dart';

class GetChapters extends BaseUseCase<List<ChapterEntity>, int> {
  final CourseRepository _repository;

  GetChapters({required CourseRepository repository})
      : _repository = repository;

  @override
  Future<List<ChapterEntity>> call(int params) async =>
      _repository.getChapters(chapterId: params);
}
