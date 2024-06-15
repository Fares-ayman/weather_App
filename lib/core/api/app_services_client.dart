import 'package:dio/dio.dart';

abstract class AppServicesClient {
  Future<Response> getWeatherByLocation(
      {required double latitude, required double longitude});
  Future<Response> getWeatherByCityName({required String cityName});
}
