import 'package:flutter_template/modules/home/data/datasource/remote_datasource/home_remote_datasource.dart';
import 'package:flutter_template/modules/home/data/datasource/remote_datasource/home_remote_datasource_impl.dart';
import 'package:flutter_template/modules/home/data/repository/home_repository_impl.dart';
import 'package:flutter_template/modules/home/domain/repository/home_repository.dart';
import 'package:flutter_template/modules/home/domain/usecase/get_weather_by_city_name_use_case.dart';
import 'package:flutter_template/modules/home/domain/usecase/get_weather_by_location_use_case.dart';
import 'package:flutter_template/modules/home/presentation/controllers/weather_bloc.dart';

import 'package:get_it/get_it.dart';
import 'package:flutter_template/core/api/app_services_client.dart';
import 'package:flutter_template/core/api/app_services_client_impl.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/network/netwok_info.dart';
import 'core/network/network_info_impl.dart';

final sl = GetIt.instance;

Future<void> init() async {
  ////// home module
  ///////////////////////////////////////////////////////////////////////////////////////////
  sl.registerFactory(
    () => WeatherBloc(
      sl(),
      sl(),
    ),
  );

  sl.registerLazySingleton(
    () => GetWatherByLocationUseCase(
      sl(),
    ),
  );
  sl.registerLazySingleton(
    () => GetWeatherByCityNameUseCase(
      sl(),
    ),
  );

  sl.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(
        remoteDataSource: sl(),
        networkInfo: sl(),
      ));

  sl.registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl(appServicesClient: sl()));

  ///////////////////////////////////////////////////////////////////////////////////////////

  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(internetConnectionChecker: sl()));
  sl.registerLazySingleton(() => InternetConnectionChecker());

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  sl.registerLazySingleton<AppServicesClient>(() => AppServicesClientImpl());
}
