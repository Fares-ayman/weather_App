import 'package:flutter_template/modules/home/data/models/weather_model.dart';

abstract class HomeRemoteDataSource {
  Future<WeatherModel> getWeatherByLocation(
      {required double latitude, required double longitude});
  Future<WeatherModel> getWeatherByCityName({required String cityName});
}
