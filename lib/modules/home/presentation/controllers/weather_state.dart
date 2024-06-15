part of 'weather_bloc.dart';

class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

final class WeatherInitial extends WeatherState {}

final class WeatherLoading extends WeatherState {}

final class WeatherFailure extends WeatherState {
  final Failure failure;

  const WeatherFailure(this.failure);
}

final class WeatherSuccess extends WeatherState {
  final WeatherEntity weather;

  const WeatherSuccess(
    this.weather,
  );

  @override
  List<Object> get props => [weather];
}
