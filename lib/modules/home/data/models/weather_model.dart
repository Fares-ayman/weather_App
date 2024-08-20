// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_template/modules/home/domain/entity/weather_entity.dart';

class WeatherModel extends WeatherEntity {
  WeatherModel({
    required super.lat,
    required super.lon,
    required super.weatherConditionCode,
    required super.weatherDescription,
    required super.weatherName,
    required super.temp,
    required super.tempMax,
    required super.tempMin,
    required super.country,
    required super.areaName,
    required super.sunRise,
    required super.sunSet,
  });
}
