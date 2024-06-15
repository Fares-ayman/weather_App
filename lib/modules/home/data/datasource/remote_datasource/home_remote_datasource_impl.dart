import 'package:flutter_template/core/api/app_services_client.dart';
import 'package:flutter_template/core/api/status_code.dart';
import 'package:flutter_template/core/error/exceptions.dart';

import 'package:flutter_template/modules/home/data/datasource/remote_datasource/home_remote_datasource.dart';
import 'package:flutter_template/modules/home/data/models/weather_model.dart';

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final AppServicesClient appServicesClient;

  HomeRemoteDataSourceImpl({required this.appServicesClient});

  @override
  Future<WeatherModel> getWeatherByCityName({required String cityName}) async {
    final response =
        await appServicesClient.getWeatherByCityName(cityName: cityName);
    if (response.statusCode == StatusCode.ok) {
      final WeatherModel weatherModel = WeatherModel(
        lat: response.data['coord']['lat'],
        lon: response.data['coord']['lon'],
        weatherConditionCode: response.data['weather'][0]['id'],
        weatherDescription: response.data['weather'][0]['description'],
        weatherName: response.data['weather'][0]['main'],
        temp: response.data['main']['temp'],
        tempMax: response.data['main']['temp_max'],
        tempMin: response.data['main']['temp_min'],
        country: response.data['sys']['country'],
        sunRise: response.data['sys']['sunrise'],
        sunSet: response.data['sys']['sunset'],
        areaName: response.data['name'],
      );

      return weatherModel;
    } else {
      throw DataEmptyException();
    }
  }

  @override
  Future<WeatherModel> getWeatherByLocation(
      {required double latitude, required double longitude}) async {
    final response = await appServicesClient.getWeatherByLocation(
        latitude: latitude, longitude: longitude);

    if (response.statusCode == StatusCode.ok) {
      final WeatherModel weatherModel = WeatherModel(
        lat: response.data['coord']['lat'],
        lon: response.data['coord']['lon'],
        weatherConditionCode: response.data['weather'][0]['id'],
        weatherDescription: response.data['weather'][0]['description'],
        weatherName: response.data['weather'][0]['main'],
        temp: response.data['main']['temp'],
        tempMax: response.data['main']['temp_max'],
        tempMin: response.data['main']['temp_min'],
        country: response.data['sys']['country'],
        sunRise: response.data['sys']['sunrise'],
        sunSet: response.data['sys']['sunset'],
        areaName: response.data['name'],
      );

      return weatherModel;
    } else {
      throw DataEmptyException();
    }
  }
}
