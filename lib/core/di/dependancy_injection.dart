import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shark_mobile/core/networking/dio_factory.dart';
import 'package:shark_mobile/features/home/logic/cubit/home_cubit.dart';

GetIt getIt = GetIt.instance;
Future<void> setupGetit() async {
  // Dio & ApiServices
  Dio dio = DioFactory.getDio();
  // getIt.registerLazySingleton<ApiServices>(() => ApiServices(dio));
  // // login
  // getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit());
  // // register
  // getIt.registerLazySingleton<RegisterRepo>(() => RegisterRepo(getIt()));
  // getIt.registerFactory<RegisterCubit>(() => RegisterCubit(getIt()));
  // // home
  // getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(dio));
  // getIt.registerFactory<HomeRepo>(() => HomeRepo(getIt()));
}
