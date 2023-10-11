import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:tz/Three/data/http.dart';
import 'package:tz/Three/presentation/bloc/cubit.dart';
import 'package:tz/second/data/http.dart';
import 'package:tz/second/presentation/bloc/cubit.dart';
import '/first/data/http.dart';
import '/first/presentation/bloc/cubit.dart';
final sl = GetIt.instance;
Future<void> init() async {
  //BLOC / Cubit
  sl.registerFactory(
    () => FirstCubit(
      getFirstUrl: sl(),
    ),
  );
  sl.registerFactory(
    () => SecondCubit(
      getSecondUrl: sl(),
    ),
  );sl.registerFactory(
    () => ThreeCubit(
      getThreeUrl: sl(),
    ),
  );
  //UseCases
  // sl.registerLazySingleton(() => GetAnime(sl()));
  
  // //Repository
  // sl.registerLazySingleton<PhoneRepository>(() => PhoneRepositoryImpl(
  //       remoteDataSource: sl(),
  //       localDataSource: sl(),
  //       networkInfo: sl(),
  //     ));
  
  sl.registerLazySingleton(
      () => GetFirstUrl());

  sl.registerLazySingleton(
      () => GetSecondUrl());

  sl.registerLazySingleton(
      () => GetThreeUrl());
  //External
  sl.registerLazySingleton(() => http.Client());
  // sl.registerLazySingleton(() => Dio());
}