import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_template/core/resourses/values_manager.dart';
import 'package:flutter_template/modules/home/presentation/controllers/weather_bloc.dart';
import 'package:flutter_template/modules/home/presentation/widgets/home_error_widget.dart';
import 'package:flutter_template/modules/home/presentation/widgets/home_loading_widget.dart';

import 'package:flutter_template/modules/home/presentation/widgets/home_weather_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<WeatherBloc>().add(
          const GetWeatherByLocation(),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(
          AppPadding.p40.w,
          1.2 * kToolbarHeight.h,
          AppPadding.p40.w,
          AppPadding.p20.h,
        ),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Align(
                alignment: const AlignmentDirectional(3, -0.3),
                child: Container(
                  height: 300.h,
                  width: 300.w,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.deepPurple),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-3, -0.3),
                child: Container(
                  height: 300.h,
                  width: 300.w,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xFF673AB7)),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, -1.2),
                child: Container(
                  height: 300.h,
                  width: 600.w,
                  decoration: const BoxDecoration(color: Color(0xFFFFAB40)),
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
                child: Container(
                  decoration: const BoxDecoration(color: Colors.transparent),
                ),
              ),
              BlocBuilder<WeatherBloc, WeatherState>(
                builder: (context, state) {
                  if (state is WeatherSuccess) {
                    return HomeWeatherWidget(
                      weatherEntity: state.weather,
                    );
                  } else if (state is WeatherFailure) {
                    return HomeErrorWidget(failure: state.failure);
                  }
                  return const HomeLoadingWidget();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
