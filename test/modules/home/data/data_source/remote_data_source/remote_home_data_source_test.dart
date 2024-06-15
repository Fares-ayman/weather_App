import 'package:dio/dio.dart';

import 'package:flutter_template/core/api/app_services_client.dart';
import 'package:flutter_template/core/error/exceptions.dart';
import 'package:flutter_template/modules/home/data/datasource/remote_datasource/home_remote_datasource_impl.dart';
import 'package:flutter_template/modules/home/data/models/weather_model.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/mockito.dart';

class MockDioRequest extends Mock implements AppServicesClient {
  final Map<String, dynamic>? json;
  final int? statusCode;

  MockDioRequest({
    required this.json,
    required this.statusCode,
  });
  @override
  Future<Response> getWeatherByLocation(
      {required double latitude, required double longitude}) async {
    Response response = Response(
      requestOptions: RequestOptions(),
      data: json,
      statusCode: statusCode,
    );
    return response;
  }

  @override
  Future<Response> getWeatherByCityName({required String cityName}) async {
    Response response = Response(
      requestOptions: RequestOptions(),
      data: json,
      statusCode: statusCode,
    );
    return response;
  }
}

void main() {
  late HomeRemoteDataSourceImpl homeRemoteDataSourceImpl;
  late MockDioRequest mockDioRequest;

  final WeatherModel mockSuccessData = WeatherModel(
    lat: 30.7858,
    lon: 29.2186,
    weatherConditionCode: 800,
    weatherDescription: "clear sky",
    weatherName: "Clear",
    temp: 34.17,
    tempMax: 34.17,
    tempMin: 34.17,
    country: "EG",
    areaName: "El Alamein",
    sunRise: 1718420388,
    sunSet: 1718471257,
  );
  final Map<String, dynamic> json = {
    "coord": {"lon": 29.2186, "lat": 30.7858},
    "weather": [
      {"id": 800, "main": "Clear", "description": "clear sky", "icon": "01d"}
    ],
    "base": "stations",
    "main": {
      "temp": 34.17,
      "feels_like": 39.84,
      "temp_min": 34.17,
      "temp_max": 34.17,
      "pressure": 1009,
      "humidity": 53,
      "sea_level": 1009,
      "grnd_level": 1004
    },
    "visibility": 10000,
    "wind": {"speed": 7.51, "deg": 338, "gust": 7.99},
    "clouds": {"all": 0},
    "dt": 1718448191,
    "sys": {
      "type": 1,
      "id": 2512,
      "country": "EG",
      "sunrise": 1718420388,
      "sunset": 1718471257
    },
    "timezone": 10800,
    "id": 361612,
    "name": "El Alamein",
    "cod": 200
  };

  double lat = 30.785834;
  double lon = 29.218611;

  String cityName = "El Alamein";

  group('get weather model  in remote data source', () {
    test(
      'should return weather model  data when the response code is 200 (success) (by location)',
      () async {
        // arrange
        mockDioRequest = MockDioRequest(
          json: json,
          statusCode: 200,
        );
        homeRemoteDataSourceImpl = HomeRemoteDataSourceImpl(
          appServicesClient: mockDioRequest,
        );
        /*  setUpMockDioSuccess200(); */
        // act
        final result = await homeRemoteDataSourceImpl.getWeatherByLocation(
          latitude: lat,
          longitude: lon,
        );

        // assert
        expect(
          result.areaName,
          equals(mockSuccessData.areaName),
        );
        expect(
          result.country,
          equals(mockSuccessData.country),
        );
        expect(
          result.lat,
          equals(mockSuccessData.lat),
        );
        expect(
          result.lon,
          equals(mockSuccessData.lon),
        );
        expect(
          result.sunRise,
          equals(mockSuccessData.sunRise),
        );
        expect(
          result.sunSet,
          equals(mockSuccessData.sunSet),
        );
        expect(
          result.temp,
          equals(mockSuccessData.temp),
        );
        expect(
          result.tempMax,
          equals(mockSuccessData.tempMax),
        );
        expect(
          result.tempMin,
          equals(mockSuccessData.tempMin),
        );
        expect(
          result.weatherConditionCode,
          equals(mockSuccessData.weatherConditionCode),
        );
        expect(
          result.weatherDescription,
          equals(mockSuccessData.weatherDescription),
        );
        expect(
          result.weatherName,
          equals(mockSuccessData.weatherName),
        );
      },
    );

    test(
      'should return weather model  data when the response code is 200 (success) (by city name )',
      () async {
        // arrange
        mockDioRequest = MockDioRequest(
          json: json,
          statusCode: 200,
        );
        homeRemoteDataSourceImpl = HomeRemoteDataSourceImpl(
          appServicesClient: mockDioRequest,
        );
        /*  setUpMockDioSuccess200(); */
        // act
        final result = await homeRemoteDataSourceImpl.getWeatherByCityName(
          cityName: cityName,
        );

        // assert
        expect(
          result.areaName,
          equals(mockSuccessData.areaName),
        );
        expect(
          result.country,
          equals(mockSuccessData.country),
        );
        expect(
          result.lat,
          equals(mockSuccessData.lat),
        );
        expect(
          result.lon,
          equals(mockSuccessData.lon),
        );
        expect(
          result.sunRise,
          equals(mockSuccessData.sunRise),
        );
        expect(
          result.sunSet,
          equals(mockSuccessData.sunSet),
        );
        expect(
          result.temp,
          equals(mockSuccessData.temp),
        );
        expect(
          result.tempMax,
          equals(mockSuccessData.tempMax),
        );
        expect(
          result.tempMin,
          equals(mockSuccessData.tempMin),
        );
        expect(
          result.weatherConditionCode,
          equals(mockSuccessData.weatherConditionCode),
        );
        expect(
          result.weatherDescription,
          equals(mockSuccessData.weatherDescription),
        );
        expect(
          result.weatherName,
          equals(mockSuccessData.weatherName),
        );
      },
    );

    test(
      'should throw exception when the response code is 404 (data empty exception)',
      () async {
        // arrange
        mockDioRequest = MockDioRequest(
          json: json,
          statusCode: 404,
        );
        homeRemoteDataSourceImpl = HomeRemoteDataSourceImpl(
          appServicesClient: mockDioRequest,
        );
        // act
        // assert
        expect(
            () => homeRemoteDataSourceImpl.getWeatherByLocation(
                latitude: lat, longitude: lon),
            throwsA(const TypeMatcher<DataEmptyException>()));
      },
    );
  });
}
