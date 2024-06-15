import 'package:flutter_template/core/error/failures.dart';
import 'package:flutter_template/core/network/netwok_info.dart';
import 'package:flutter_template/modules/home/data/datasource/remote_datasource/home_remote_datasource.dart';
import 'package:flutter_template/modules/home/data/models/weather_model.dart';
import 'package:flutter_template/modules/home/data/repository/home_repository_impl.dart';
import 'package:flutter_template/modules/home/domain/entity/weather_entity.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_repository_impl_test.mocks.dart';

@GenerateMocks([HomeRemoteDataSource, NetworkInfo])
void main() {
  late MockHomeRemoteDataSource mockHomeRemoteDataSource;
  late MockNetworkInfo mockNetworkInfo;
  late HomeRepositoryImpl homeRepositoryImpl;
  setUp(
    () {
      mockHomeRemoteDataSource = MockHomeRemoteDataSource();
      mockNetworkInfo = MockNetworkInfo();
      homeRepositoryImpl = HomeRepositoryImpl(
        remoteDataSource: mockHomeRemoteDataSource,
        networkInfo: mockNetworkInfo,
      );
    },
  );

  group('get weather Model in repo', () {
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
    double lat = 30.785834;
    double lon = 29.218611;

    String cityName = "El Alamein";

    test(
      'should return remote data when the call to remote data source is successful (by location)',
      () async {
        // arrange

        when(mockHomeRemoteDataSource.getWeatherByLocation(
                latitude: lat, longitude: lon))
            .thenAnswer((_) async => mockSuccessData);
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        // act
        final result = await homeRepositoryImpl.getWeatherByLocation(
            latitude: lat, longitude: lon);

        late WeatherEntity weatherEntity;

        result.fold(
          (failure) => null,
          (data) {
            weatherEntity = data;
          },
        );
        // assert
        expect(
          weatherEntity.areaName,
          equals(mockSuccessData.areaName),
        );
        expect(
          weatherEntity.country,
          equals(mockSuccessData.country),
        );
        expect(
          weatherEntity.lat,
          equals(mockSuccessData.lat),
        );
        expect(
          weatherEntity.lon,
          equals(mockSuccessData.lon),
        );
        expect(
          weatherEntity.sunRise,
          equals(mockSuccessData.sunRise),
        );
        expect(
          weatherEntity.sunSet,
          equals(mockSuccessData.sunSet),
        );
        expect(
          weatherEntity.temp,
          equals(mockSuccessData.temp),
        );
        expect(
          weatherEntity.tempMax,
          equals(mockSuccessData.tempMax),
        );
        expect(
          weatherEntity.tempMin,
          equals(mockSuccessData.tempMin),
        );
        expect(
          weatherEntity.weatherConditionCode,
          equals(mockSuccessData.weatherConditionCode),
        );
        expect(
          weatherEntity.weatherDescription,
          equals(mockSuccessData.weatherDescription),
        );
        expect(
          weatherEntity.weatherName,
          equals(mockSuccessData.weatherName),
        );
      },
    );
    test(
      'should return remote data when the call to remote data source is successful (by city name)',
      () async {
        // arrange

        when(mockHomeRemoteDataSource.getWeatherByCityName(cityName: cityName))
            .thenAnswer((_) async => mockSuccessData);
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        // act
        final result = await homeRepositoryImpl.getWeatherByCityName(
          cityName: cityName,
        );

        late WeatherEntity weatherEntity;

        result.fold(
          (failure) => null,
          (data) {
            weatherEntity = data;
          },
        );
        // assert
        expect(
          weatherEntity.areaName,
          equals(mockSuccessData.areaName),
        );
        expect(
          weatherEntity.country,
          equals(mockSuccessData.country),
        );
        expect(
          weatherEntity.lat,
          equals(mockSuccessData.lat),
        );
        expect(
          weatherEntity.lon,
          equals(mockSuccessData.lon),
        );
        expect(
          weatherEntity.sunRise,
          equals(mockSuccessData.sunRise),
        );
        expect(
          weatherEntity.sunSet,
          equals(mockSuccessData.sunSet),
        );
        expect(
          weatherEntity.temp,
          equals(mockSuccessData.temp),
        );
        expect(
          weatherEntity.tempMax,
          equals(mockSuccessData.tempMax),
        );
        expect(
          weatherEntity.tempMin,
          equals(mockSuccessData.tempMin),
        );
        expect(
          weatherEntity.weatherConditionCode,
          equals(mockSuccessData.weatherConditionCode),
        );
        expect(
          weatherEntity.weatherDescription,
          equals(mockSuccessData.weatherDescription),
        );
        expect(
          weatherEntity.weatherName,
          equals(mockSuccessData.weatherName),
        );
      },
    );

    test(
      'should throw exception when the response code is 404 (network  exception)',
      () async {
        when(mockHomeRemoteDataSource.getWeatherByCityName(cityName: cityName))
            .thenAnswer((_) async => mockSuccessData);
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
        // act
        final result = await homeRepositoryImpl.getWeatherByCityName(
          cityName: cityName,
        );

        late Failure offlineFailure;

        result.fold(
          (failure) {
            offlineFailure = failure;
          },
          (data) {},
        );
        // assert
        expect(
          offlineFailure.code,
          equals(1),
        );
      },
    );
  });
}
