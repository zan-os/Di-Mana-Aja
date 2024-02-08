import 'package:di_mana_aja/data/datasource/remote/home_remote_datasource.dart';
import 'package:di_mana_aja/domain/entities/course_entity.dart';

import '../../domain/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource _remoteDataSource;

  HomeRepositoryImpl({required HomeRemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;

  @override
  Future<List<CourseEntity>> getCourses() async {
    final response = await _remoteDataSource.getCourses();

    final courseList =
        response.map((course) => CourseEntity.toEntity(course)).toList();
    return courseList;
  }
}
