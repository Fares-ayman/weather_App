import 'package:flutter_template/modules/home/presentation/controllers/weather_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('weather events', () {
    test(
      'Get Weather By Location',
      () async {
        expect(
          const GetWeatherByLocation(),
          const GetWeatherByLocation(),
        );
      },
    );
    test(
      'Get Weather By city name',
      () async {
        expect(
          const GetWeatherByCityName("paris").props,
          const GetWeatherByCityName("paris").props,
        );
      },
    );
  });
}
