import 'package:di_mana_aja/core/usecase/base_usecase.dart';
import 'package:di_mana_aja/domain/entities/course_entity.dart';

import '../repository/course_repository.dart';

class GetCourseDetail extends BaseUseCase<CourseEntity, int> {
  final CourseRepository _repository;

  GetCourseDetail({required CourseRepository repository})
      : _repository = repository;

  @override
  Future<CourseEntity> call(int params) async =>
      _repository.getCourse(courseId: params);
}
