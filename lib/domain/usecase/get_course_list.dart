import 'package:di_mana_aja/core/usecase/base_usecase.dart';
import 'package:di_mana_aja/domain/entities/course_entity.dart';

import '../repository/home_repository.dart';

class GetCourseList extends BaseUseCase<List<CourseEntity>, NoParams> {
  final HomeRepository _homeRepository;

  GetCourseList({required HomeRepository homeRepository})
      : _homeRepository = homeRepository;

  @override
  Future<List<CourseEntity>> call(NoParams params) async =>
      _homeRepository.getCourses();
}
