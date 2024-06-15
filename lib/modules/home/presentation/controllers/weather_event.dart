part of 'weather_bloc.dart';

sealed class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class GetWeatherByLocation extends WeatherEvent {
  const GetWeatherByLocation();

  @override
  List<Object> get props => [];
}

class GetWeatherByCityName extends WeatherEvent {
  final String cityName;

  const GetWeatherByCityName(this.cityName);

  @override
  List<Object> get props => [cityName];
}
