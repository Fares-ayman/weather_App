import 'package:flutter_template/core/error/failures.dart';
import 'package:flutter_template/core/resourses/strings_manager.dart';

import 'package:flutter_template/modules/home/domain/entity/weather_entity.dart';
import 'package:flutter_template/modules/home/presentation/controllers/weather_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
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

    final Failure offlineFailure = OfflineFailure(
      1,
      AppStrings.offlineFailureMessage,
    );
    final Failure dataEmptyFailure = DataEmptyFailure(
      0,
      AppStrings.dataEmptyFailureMessage,
    );

    WeatherInitial createInitState() {
      return WeatherInitial();
    }

    WeatherLoading createLoadingState() {
      return WeatherLoading();
    }

    WeatherFailure createFailureState(Failure failure) {
      return WeatherFailure(
        failure,
      );
    }

    WeatherSuccess createSuccessState(WeatherEntity weather) {
      return WeatherSuccess(
        weather,
      );
    }

    test(
      'Weather Initial',
      () async {
        expect(
          WeatherInitial(),
          createInitState(),
        );
      },
    );
    test(
      'Weather Loading',
      () async {
        expect(
          WeatherLoading(),
          createLoadingState(),
        );
      },
    );
    test(
      'Weather failure',
      () async {
        expect(
          WeatherFailure(
            offlineFailure,
          ),
          createFailureState(offlineFailure),
        );
        expect(
          WeatherFailure(
            dataEmptyFailure,
          ),
          createFailureState(dataEmptyFailure),
        );
      },
    );
    test(
      'Weather Success',
      () async {
        expect(
          WeatherSuccess(
            mockSuccessData,
          ),
          createSuccessState(mockSuccessData),
        );
      },
    );
  });
}
