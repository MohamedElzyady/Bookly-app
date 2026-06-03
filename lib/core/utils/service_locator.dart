import 'package:book_app/core/utils/api_service.dart';
import 'package:book_app/features/home/data/repos/home_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final gettIt = GetIt.instance;
void setUp() {
  gettIt.registerSingleton<ApiService>(ApiService(Dio()));
  gettIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(gettIt.get<ApiService>()),
  );
}
