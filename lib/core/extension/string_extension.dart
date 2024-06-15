import 'package:flutter/material.dart';
import 'package:flutter_template/core/resourses/constants_manager.dart';

extension StringExtension on String {
  Color toColor() {
    var hexColor = replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return Color(int.parse(hexColor, radix: 16));
  }
}

extension NonNullString on String?{
  String orEmpty(){
    if(this==null){
      return AppConstants.empty;
    }else{
      return this!;
    }

  }
}

extension NonNullInteger on int?{
  int orZero(){
    if(this==null){
      return AppConstants.zero;
    }else{
      return this!;
    }

  }
}
