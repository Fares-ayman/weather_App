import 'package:dio/dio.dart';

import 'package:flutter_template/core/api/app_services_client.dart';
import 'package:flutter_template/core/resourses/constants_manager.dart';

class AppServicesClientImpl extends AppServicesClient {
  late Dio _dio;

  AppServicesClientImpl() {
    BaseOptions options = BaseOptions(
      baseUrl: AppConstants.baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: AppConstants.apiTimeOut,
      receiveTimeout: AppConstants.apiTimeOut,
    );

    _dio = Dio(options);
  }

  @override
  Future<Response> getWeatherByCityName({required String cityName}) async {
    Response response = await _dio.get(
      '${AppConstants.byCityName(cityName: cityName)}&units=metric',
      options: Options(
        headers: {
          "Content-Type": AppConstants.contentType,
        },
      ),
    );
    return response;
  }

  @override
  Future<Response> getWeatherByLocation(
      {required double latitude, required double longitude}) async {
    Response response = await _dio.get(
      '${AppConstants.byLocation(latitude: latitude, longitude: longitude)}&units=metric',
      options: Options(
        headers: {
          "Content-Type": AppConstants.contentType,
        },
      ),
    );
    return response;
  }
}
