import 'package:get_it/get_it.dart';

import '../../features/home/data/repo/home_repo.dart';
import '../../features/home/logic/cubit/home_cubit.dart';
import '../networking/api_services.dart';
import '../networking/dio_factory.dart';
final getIt = GetIt.instance;
void setupGet() async{
  final dio =await DioFactory.getDio();
  // Api services
  getIt.registerLazySingleton(() => ApiServices(dio));

  // home repo
  getIt.registerLazySingleton(() => HomeRepo(apiServices: getIt()));
  // home cubit
  getIt.registerFactory(() => HomeCubit(homeRepo: getIt()));
}