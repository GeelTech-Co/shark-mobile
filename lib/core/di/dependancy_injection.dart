import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shark_mobile/core/networking/dio_factory.dart';
import 'package:shark_mobile/features/auth/data/apis/auth_api_service.dart';
import 'package:shark_mobile/features/auth/data/repos/auth_repo_implementation.dart';
import 'package:shark_mobile/features/auth/logic/register_cubit.dart';
import 'package:shark_mobile/features/home/logic/cubit/home_cubit.dart';

GetIt getIt = GetIt.instance;
Future<void> setupGetit() async {
  // Dio & ApiServices
  final dio = await DioFactory.getDio();

  getIt.registerLazySingleton<Dio>(() => dio);

  getIt.registerFactory<HomeCubit>(() => HomeCubit());

  getIt.registerLazySingleton<AuthApiService>(() => AuthApiService(getIt()));

  getIt.registerLazySingleton<AuthRepoImplementation>(
    () => AuthRepoImplementation(getIt()),
  );
  getIt.registerFactory<RegisterCubit>(() => RegisterCubit(getIt()));

  // getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(dio));
  // getIt.registerFactory<HomeRepo>(() => HomeRepo(getIt()));
}
