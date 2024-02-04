import 'package:di_mana_aja/features/home/data/datasource/remote/home_remote_datasource.dart';
import 'package:di_mana_aja/features/home/data/repository/home_repository_impl.dart';
import 'package:di_mana_aja/features/home/domain/repository/home_repository.dart';
import 'package:di_mana_aja/features/home/domain/usecase/get_course.dart';

import '../../../registered_injection.dart';

class HomeInjection {
  HomeInjection() {
    _registerDataSource();
    _registerRepository();
    _registerUseCase();
  }

  _registerDataSource() {
    sl.registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl(),
    );
  }

  _registerRepository() {
    sl.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(remoteDataSource: sl()),
    );
  }

  _registerUseCase() {
    sl.registerLazySingleton<GetCourses>(
      () => GetCourses(homeRepository: sl()),
    );
  }
}
