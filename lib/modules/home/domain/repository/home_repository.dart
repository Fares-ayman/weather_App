import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/error/failures.dart';
import 'package:flutter_template/modules/home/domain/entity/weather_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, WeatherEntity>> getWeatherByLocation(
      {required double latitude, required double longitude});
  Future<Either<Failure, WeatherEntity>> getWeatherByCityName(
      {required String cityName});
}
