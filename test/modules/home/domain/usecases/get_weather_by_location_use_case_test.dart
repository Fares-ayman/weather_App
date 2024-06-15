import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/error/failures.dart';
import 'package:flutter_template/core/resourses/strings_manager.dart';

import 'package:flutter_template/modules/home/domain/entity/weather_entity.dart';
import 'package:flutter_template/modules/home/domain/repository/home_repository.dart';
import 'package:flutter_template/modules/home/domain/usecase/get_weather_by_location_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_weather_by_location_use_case_test.mocks.dart';

@GenerateMocks([HomeRepository])
void main() {
  late MockHomeRepository mockHomeRepository;

  late GetWatherByLocationUseCase getWatherByLocationUseCase;

  setUp(
    () {
      mockHomeRepository = MockHomeRepository();

      getWatherByLocationUseCase = GetWatherByLocationUseCase(
        mockHomeRepository,
      );
    },
  );

  group('get Weather in use case', () {
    final WeatherEntity mockSuccessData = WeatherEntity(
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

    test(
      'should return remote data when the call to remote data source is successful',
      () async {
        // arrange
        when(mockHomeRepository.getWeatherByLocation(
                latitude: lat, longitude: lon))
            .thenAnswer((_) async => Right(mockSuccessData));
        // act
        final result = await getWatherByLocationUseCase.call(
          latitude: lat,
          longitude: lon,
        );

        late WeatherEntity weatherEntity;

        result.fold(
          (failure) => null,
          (data) {
            weatherEntity = data;
          },
        );

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
      'should return offline faiulure when the call to remote data source is successful',
      () async {
        // arrange
        when(mockHomeRepository.getWeatherByLocation(
                latitude: lat, longitude: lon))
            .thenAnswer((_) async => Left(
                  OfflineFailure(
                    1,
                    AppStrings.offlineFailureMessage,
                  ),
                ));
        // act
        final result = await getWatherByLocationUseCase.call(
          latitude: lat,
          longitude: lon,
        );

        late Failure offlineFailure;

        result.fold(
          (failure) {
            offlineFailure = failure;
          },
          (data) => null,
        );

        expect(
          offlineFailure.code,
          equals(1),
        );
        expect(
          offlineFailure.message,
          equals(AppStrings.offlineFailureMessage),
        );
      },
    );
    test(
      'should return Data empty faiulure when the call to remote data source is successful',
      () async {
        // arrange
        when(mockHomeRepository.getWeatherByLocation(
                latitude: lat, longitude: lon))
            .thenAnswer(
          (_) async => Left(
            DataEmptyFailure(
              0,
              AppStrings.dataEmptyFailureMessage,
            ),
          ),
        );
        // act
        final result = await getWatherByLocationUseCase.call(
          latitude: lat,
          longitude: lon,
        );

        late Failure dataEmptyFailure;

        result.fold(
          (failure) {
            dataEmptyFailure = failure;
          },
          (data) => null,
        );

        expect(
          dataEmptyFailure.code,
          equals(0),
        );
        expect(
          dataEmptyFailure.message,
          equals(AppStrings.dataEmptyFailureMessage),
        );
      },
    );
  });
}
