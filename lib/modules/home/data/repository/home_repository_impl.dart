import 'package:dartz/dartz.dart';

import 'package:flutter_template/core/error/failures.dart';

import 'package:flutter_template/core/network/netwok_info.dart';
import 'package:flutter_template/core/resourses/strings_manager.dart';
import 'package:flutter_template/modules/home/data/datasource/remote_datasource/home_remote_datasource.dart';

import 'package:flutter_template/modules/home/domain/entity/weather_entity.dart';

import 'package:flutter_template/modules/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  final NetworkInfo networkInfo;

  HomeRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, WeatherEntity>> getWeatherByCityName(
      {required String cityName}) async {
    if (await networkInfo.isConnected) {
      try {
        final weatherModel =
            await remoteDataSource.getWeatherByCityName(cityName: cityName);

        return Right(weatherModel);
      } catch (error) {
        return Left(
          DataEmptyFailure(
            0,
            AppStrings.dataEmptyFailureMessage,
          ),
        );
      }
    } else {
      return Left(
        OfflineFailure(
          1,
          AppStrings.offlineFailureMessage,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, WeatherEntity>> getWeatherByLocation(
      {required double latitude, required double longitude}) async {
    if (await networkInfo.isConnected) {
      try {
        final weatherModel = await remoteDataSource.getWeatherByLocation(
            latitude: latitude, longitude: longitude);

        return Right(weatherModel);
      } catch (error) {
        return Left(
          DataEmptyFailure(
            0,
            AppStrings.dataEmptyFailureMessage,
          ),
        );
      }
    } else {
      return Left(
        OfflineFailure(
          1,
          AppStrings.offlineFailureMessage,
        ),
      );
    }
  }
}
