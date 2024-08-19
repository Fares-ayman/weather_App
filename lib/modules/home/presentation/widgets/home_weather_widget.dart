import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/core/extension/functions.dart';
import 'package:flutter_template/core/resourses/assets_manager.dart';
import 'package:flutter_template/core/resourses/color_manager.dart';
import 'package:flutter_template/core/resourses/routes_manager.dart';
import 'package:flutter_template/core/resourses/values_manager.dart';
import 'package:flutter_template/modules/home/domain/entity/weather_entity.dart';
import 'package:flutter_template/modules/home/presentation/controllers/weather_bloc.dart';

import 'package:flutter_template/modules/home/presentation/widgets/home_weather_item_details_widget.dart';
import 'package:intl/intl.dart';

class HomeWeatherWidget extends StatelessWidget {
  final WeatherEntity weatherEntity;
  const HomeWeatherWidget({
    super.key,
    required this.weatherEntity,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '📍 ${weatherEntity.areaName}',
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w300),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutesName.searchPage);
                    },
                    child: SizedBox(
                      height: AppSize.s40.h,
                      width: AppSize.s40.w,
                      child: Icon(
                        Icons.search,
                        size: AppSize.s20,
                        color: AppColor.white,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      context.read<WeatherBloc>().add(
                            const GetWeatherByLocation(),
                          );
                    },
                    child: SizedBox(
                      height: AppSize.s40.h,
                      width: AppSize.s40.w,
                      child: Icon(
                        Icons.location_on,
                        size: AppSize.s20,
                        color: AppColor.white,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Good Morning',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          getWeatherIcon(weatherEntity.weatherConditionCode),
          Center(
            child: Text(
              '${weatherEntity.temp}°C',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 55.sp,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Center(
            child: Text(
              weatherEntity.weatherName.toUpperCase(),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: 5),
          Center(
            child: Text(
              DateFormat('EEEE dd •').add_jm().format(DateTime.now()),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w300),
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HomeWeatherItemDetailsWidget(
                image: AppImageAssets.sunRise,
                title: 'Sunrise',
                details: DateFormat().add_jm().format(
                    DateTime.fromMillisecondsSinceEpoch(
                        weatherEntity.sunRise * 1000)),
              ),
              HomeWeatherItemDetailsWidget(
                image: AppImageAssets.sunSet,
                title: 'Sunset',
                details: DateFormat().add_jm().format(
                    DateTime.fromMillisecondsSinceEpoch(
                        weatherEntity.sunSet * 1000)),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: Divider(
              color: Colors.grey,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HomeWeatherItemDetailsWidget(
                image: AppImageAssets.tempMax,
                title: 'Temp Max',
                details: "${weatherEntity.tempMax} °C",
              ),
              HomeWeatherItemDetailsWidget(
                image: AppImageAssets.tempMin,
                title: 'Temp Min',
                details: "${weatherEntity.tempMin} °C",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
