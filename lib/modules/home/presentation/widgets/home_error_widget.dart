import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/core/component/widget/progress_button.dart';
import 'package:flutter_template/core/error/failures.dart';
import 'package:flutter_template/core/resourses/assets_manager.dart';
import 'package:flutter_template/core/resourses/color_manager.dart';
import 'package:flutter_template/core/resourses/values_manager.dart';
import 'package:flutter_template/modules/home/presentation/controllers/weather_bloc.dart';
import 'package:lottie/lottie.dart';

class HomeErrorWidget extends StatelessWidget {
  final Failure failure;
  const HomeErrorWidget({
    super.key,
    required this.failure,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppSize.s50.verticalSpace,
          Lottie.asset(
            failure.code == 0
                ? AppJsonAssets.emptyJson
                : AppJsonAssets.offliseJson,
            height: 200.h,
            width: 300.w,
          ),
          Text(
            failure.message,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 25.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          AppSize.s16.verticalSpace,
          AppProgressButton(
            height: AppSize.s32.h,
            width: AppSize.s100.w,
            onPressed: (animationController) {
              context.read<WeatherBloc>().add(
                    const GetWeatherByLocation(),
                  );
            },
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: AppSize.s16.sp,
              fontWeight: FontWeight.bold,
            ),
            backgroundColor: AppColor.primaryColor,
            text: "Refresh",
          ),
        ],
      ),
    );
  }
}
