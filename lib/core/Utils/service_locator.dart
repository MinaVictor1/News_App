import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:newsapp/feature/home/data/repo/home_repo_implement.dart';
import 'package:newsapp/feature/search/data/repo/search_repo_implement.dart';

import 'api_service.dart';

final getIt = GetIt.instance;

void setupservicelocator() {
  getIt.registerSingleton<ApiServise>(ApiServise(dio: Dio()));
  getIt.registerSingleton<HomeRepoImplement>(
      HomeRepoImplement(apiService: getIt.get<ApiServise>()));

  getIt.registerSingleton<SearchRepoImplement>(
      SearchRepoImplement(apiService: getIt.get<ApiServise>()));
}
