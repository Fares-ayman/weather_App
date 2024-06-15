import 'package:flutter_template/modules/home/presentation/controllers/weather_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('weather events', () {
    test(
      'Get Weather By Location',
      () async {
        expect(
          GetWeatherByLocation(),
          GetWeatherByLocation(),
        );
      },
    );
    test(
      'Get Weather By city name',
      () async {
        expect(
          GetWeatherByCityName("paris").props,
          GetWeatherByCityName("paris").props,
        );
      },
    );
  });
}
