import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/core/component/widget/progress_button.dart';
import 'package:flutter_template/core/resourses/color_manager.dart';
import 'package:flutter_template/core/resourses/values_manager.dart';
import 'package:flutter_template/modules/home/presentation/controllers/weather_bloc.dart';

class HomeSearchWidget extends StatefulWidget {
  const HomeSearchWidget({super.key});

  @override
  State<HomeSearchWidget> createState() => _HomeSearchWidgetState();
}

class _HomeSearchWidgetState extends State<HomeSearchWidget> {
  String textValue = "";

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenUtil().screenWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
            onChanged: (value) {
              setState(() {
                textValue = value;
              });
            },
            cursorColor: Colors.black,
            style: TextStyle(color: AppColor.black),
            decoration: InputDecoration(
              hintText: "Enter City Name",
              filled: true,
              fillColor: AppColor.white,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(
                  AppSize.s16.r,
                ),
              ),
            ),
          ),
          AppSize.s16.verticalSpace,
          IgnorePointer(
            ignoring: textValue.isEmpty ? true : false,
            child: AppProgressButton(
              height: AppSize.s32.h,
              width: AppSize.s100.w,
              onPressed: (animationController) {
                context.read<WeatherBloc>().add(
                      GetWeatherByCityName(textValue),
                    );
                Navigator.pop(context);
              },
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: AppSize.s16.sp,
                fontWeight: FontWeight.bold,
              ),
              backgroundColor:
                  textValue.isEmpty ? AppColor.blueGrey : AppColor.primaryColor,
              text: "Submit",
            ),
          )
        ],
      ),
    );
  }
}
