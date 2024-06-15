import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/error/failures.dart';
import 'package:flutter_template/core/resourses/strings_manager.dart';
import 'package:flutter_template/modules/home/domain/entity/weather_entity.dart';
import 'package:flutter_template/modules/home/domain/usecase/get_weather_by_city_name_use_case.dart';
import 'package:flutter_template/modules/home/domain/usecase/get_weather_by_location_use_case.dart';
import 'package:flutter_template/modules/home/presentation/controllers/weather_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'weather_bloc_test.mocks.dart';

@GenerateMocks([GetWeatherByCityNameUseCase, GetWatherByLocationUseCase])
void main() {
  late MockGetWatherByLocationUseCase mockGetWatherByLocationUseCase;
  late MockGetWeatherByCityNameUseCase mockGetWeatherByCityNameUseCase;
  late WeatherBloc weatherBloc;

  setUp(
    () {
      mockGetWatherByLocationUseCase = MockGetWatherByLocationUseCase();
      mockGetWeatherByCityNameUseCase = MockGetWeatherByCityNameUseCase();
      weatherBloc = WeatherBloc(
          mockGetWatherByLocationUseCase, mockGetWeatherByCityNameUseCase);
    },
  );
  group('weather state', () {
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

    String cityName = "El Alamein";
    test(
      'Weather Init state',
      () async {
        expect(
          weatherBloc.state,
          WeatherInitial(),
        );
      },
    );

    blocTest<WeatherBloc, WeatherState>(
      'emits [success] when MyEvent is added.(by city name)',
      build: () => weatherBloc,
      act: (bloc) {
        when(mockGetWeatherByCityNameUseCase.call(cityName: cityName))
            .thenAnswer((_) async => Right(mockSuccessData));
        bloc.add(
          GetWeatherByCityName(cityName),
        );
      },
      expect: () => <WeatherState>[
        WeatherLoading(),
        WeatherSuccess(
          mockSuccessData,
        ),
      ],
    );
    blocTest<WeatherBloc, WeatherState>(
      'emits [failure] when MyEvent is added.(by city name)',
      build: () => weatherBloc,
      act: (bloc) {
        when(mockGetWeatherByCityNameUseCase.call(cityName: cityName))
            .thenAnswer(
          (_) async => Left(
            DataEmptyFailure(
              1,
              AppStrings.offlineFailureMessage,
            ),
          ),
        );
        bloc.add(
          GetWeatherByCityName(cityName),
        );
      },
      expect: () => <WeatherState>[
        WeatherLoading(),
        WeatherFailure(
          DataEmptyFailure(
            1,
            AppStrings.offlineFailureMessage,
          ),
        ),
      ],
    );
  });
}
