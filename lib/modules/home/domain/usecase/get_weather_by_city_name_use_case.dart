import 'package:dartz/dartz.dart';
import 'package:flutter_template/modules/home/domain/entity/weather_entity.dart';

import 'package:flutter_template/modules/home/domain/repository/home_repository.dart';

import '../../../../core/error/failures.dart';

class GetWeatherByCityNameUseCase {
  final HomeRepository _homeRepository;

  GetWeatherByCityNameUseCase(
    this._homeRepository,
  );

  Future<Either<Failure, WeatherEntity>> call(
      {required String cityName}) async {
    return await _homeRepository.getWeatherByCityName(cityName: cityName);
  }
}
