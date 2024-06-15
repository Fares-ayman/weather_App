class AppConstants {
  static const String baseUrl =
      'https://api.openweathermap.org/data/2.5/weather?';
  static const String apiKey = "f374352047d5b11351220c19587e6926";

  static String byLocation(
          {required double latitude, required double longitude}) =>
      'lat=$latitude&lon=$longitude&appid=$apiKey';
  static String byCityName({required String cityName}) =>
      'q=$cityName&appid=$apiKey';
  static const String contentType = "application/json";
  static const String accept = "application/json";

  static const String empty = "";
  static const int zero = 0;
  static const Duration apiTimeOut = Duration(seconds: 20);

  static const String fontFamily = "Montserrat";
  static const String imagePath = "assets/images";
  static const String jsonPath = "assets/jsons";
}
