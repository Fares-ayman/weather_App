import 'package:dartz/dartz.dart';
import 'package:flutter_template/modules/home/domain/entity/weather_entity.dart';

import 'package:flutter_template/modules/home/domain/repository/home_repository.dart';

import '../../../../core/error/failures.dart';

class GetWatherByLocationUseCase {
  final HomeRepository _homeRepository;

  GetWatherByLocationUseCase(
    this._homeRepository,
  );

  Future<Either<Failure, WeatherEntity>> call(
      {required double latitude, required double longitude}) async {
    return await _homeRepository.getWeatherByLocation(
      latitude: latitude,
      longitude: longitude,
    );
  }
}
