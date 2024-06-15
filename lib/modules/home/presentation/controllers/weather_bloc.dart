import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/core/error/failures.dart';
import 'package:flutter_template/core/extension/functions.dart';
import 'package:flutter_template/modules/home/domain/entity/weather_entity.dart';
import 'package:flutter_template/modules/home/domain/usecase/get_weather_by_city_name_use_case.dart';
import 'package:flutter_template/modules/home/domain/usecase/get_weather_by_location_use_case.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetWatherByLocationUseCase getWatherByLocationUseCase;
  final GetWeatherByCityNameUseCase getWeatherByCityNameUseCase;
  WeatherBloc(this.getWatherByLocationUseCase, this.getWeatherByCityNameUseCase)
      : super(WeatherInitial()) {
    on<GetWeatherByLocation>((event, emit) async {
      emit(WeatherLoading());

      await determinePosition().then(
        (value) async {
          Either<Failure, WeatherEntity> data =
              await getWatherByLocationUseCase.call(
            latitude: value.latitude,
            longitude: value.longitude,
          );

          data.fold(
            (failure) {
              emit(
                WeatherFailure(failure),
              );
            },
            (success) {
              emit(
                WeatherSuccess(success),
              );
            },
          );
        },
      );
    });
    on<GetWeatherByCityName>((event, emit) async {
      emit(WeatherLoading());

      Either<Failure, WeatherEntity> data =
          await getWeatherByCityNameUseCase.call(
        cityName: event.cityName,
      );
      data.fold(
        (failure) {
          emit(
            WeatherFailure(failure),
          );
        },
        (success) {
          emit(
            WeatherSuccess(success),
          );
        },
      );
    });
  }
}
