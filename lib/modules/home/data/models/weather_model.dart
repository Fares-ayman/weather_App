// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_template/modules/home/domain/entity/weather_entity.dart';

class WeatherModel extends WeatherEntity {
  final double lat;
  final double lon;
  final int weatherConditionCode;
  final String weatherName;
  final String weatherDescription;
  final double temp;
  final double tempMax;
  final double tempMin;
  final String country;
  final String areaName;
  final int sunRise;
  final int sunSet;
  WeatherModel({
    required this.lat,
    required this.lon,
    required this.weatherConditionCode,
    required this.weatherDescription,
    required this.weatherName,
    required this.temp,
    required this.tempMax,
    required this.tempMin,
    required this.country,
    required this.areaName,
    required this.sunRise,
    required this.sunSet,
  }) : super(
          lat: lat,
          lon: lon,
          weatherConditionCode: weatherConditionCode,
          weatherDescription: weatherDescription,
          weatherName: weatherName,
          temp: temp,
          tempMax: tempMax,
          tempMin: tempMin,
          country: country,
          areaName: areaName,
          sunRise: sunRise,
          sunSet: sunSet,
        );
}
