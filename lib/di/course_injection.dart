import 'package:di_mana_aja/domain/usecase/get_course_detail.dart';

import '../data/datasource/remote/course_remote_datasource.dart';
import '../data/repository/course_repository_impl.dart';
import '../domain/repository/course_repository.dart';
import '../domain/usecase/get_chapters.dart';
import 'registered_injection.dart';

class CourseInjection {
  CourseInjection() {
    _registerDataSource();
    _registerRepository();
    _registerUseCase();
  }

  _registerDataSource() {
    sl.registerLazySingleton<CourseRemoteDataSource>(
      () => CourseRemoteDataSourceImpl(),
    );
  }

  _registerRepository() {
    sl.registerLazySingleton<CourseRepository>(
      () => CourseRepositoryImpl(remoteDataSource: sl()),
    );
  }

  _registerUseCase() {
    sl.registerLazySingleton<GetChapters>(
      () => GetChapters(repository: sl()),
    );
    sl.registerLazySingleton<GetCourseDetail>(
      () => GetCourseDetail(repository: sl()),
    );
  }
}
