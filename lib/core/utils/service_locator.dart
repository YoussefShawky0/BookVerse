import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/book_feature/data/repositories/home_repo_impl.dart';
import 'package:bookly_app/features/search/data/repositories/search_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton<ApiService>(() => ApiService(Dio()));

  getIt.registerLazySingleton<HomeRepoImpl>(
    () => HomeRepoImpl(getIt<ApiService>()),
  );

  getIt.registerLazySingleton<SearchRepoImpl>(
    () => SearchRepoImpl(getIt<ApiService>()),
  );
}
