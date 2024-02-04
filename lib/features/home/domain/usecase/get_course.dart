import 'package:di_mana_aja/core/usecase/base_usecase.dart';
import 'package:di_mana_aja/features/home/domain/entities/course_entity.dart';

import '../repository/home_repository.dart';

class GetCourses extends BaseUseCase<List<CourseEntity>, NoParams> {
  final HomeRepository _homeRepository;

  GetCourses({required HomeRepository homeRepository})
      : _homeRepository = homeRepository;

  @override
  Future<List<CourseEntity>> call(NoParams params) async =>
      _homeRepository.getCourses();
}
