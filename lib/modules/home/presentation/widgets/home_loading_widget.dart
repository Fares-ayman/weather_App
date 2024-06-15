import 'package:flutter/material.dart';
import 'package:flutter_template/core/resourses/color_manager.dart';

class HomeLoadingWidget extends StatelessWidget {
  const HomeLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: AppColor.white,
      ),
    );
  }
}
