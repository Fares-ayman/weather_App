class WeatherEntity {
  final double lat;
  final double lon;
  final int weatherConditionCode;
  final String weatherName;
  final String weatherDescription;
  final double temp;
  final double tempMax;
  final double tempMin;
  final String country;
  final String areaName;
  final int sunRise;
  final int sunSet;

  WeatherEntity({
    required this.lat,
    required this.lon,
    required this.weatherConditionCode,
    required this.weatherDescription,
    required this.weatherName,
    required this.temp,
    required this.tempMax,
    required this.tempMin,
    required this.country,
    required this.areaName,
    required this.sunRise,
    required this.sunSet,
  });
}
