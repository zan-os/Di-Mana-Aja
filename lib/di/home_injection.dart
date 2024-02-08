import 'package:di_mana_aja/data/datasource/remote/home_remote_datasource.dart';
import 'package:di_mana_aja/data/repository/home_repository_impl.dart';
import 'package:di_mana_aja/domain/repository/home_repository.dart';
import 'package:di_mana_aja/domain/usecase/get_course_list.dart';

import 'registered_injection.dart';

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
    sl.registerLazySingleton<GetCourseList>(
      () => GetCourseList(homeRepository: sl()),
    );
  }
}
