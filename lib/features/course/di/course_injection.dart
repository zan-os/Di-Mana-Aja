import 'package:di_mana_aja/features/course/data/datasource/remote/course_remote_datasource.dart';
import 'package:di_mana_aja/features/course/data/repository/course_repository_impl.dart';
import 'package:di_mana_aja/features/course/domain/repository/course_repository.dart';
import 'package:di_mana_aja/features/course/domain/usecase/get_chapters.dart';

import '../../../registered_injection.dart';

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
  }
}
