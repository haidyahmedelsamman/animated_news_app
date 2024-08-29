import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/theme/colors.dart';

import 'font_weight_helper.dart';

class TextStyles {
  static TextStyle font22WhiteRegular = TextStyle(
    fontSize: 22.sp,
    fontWeight: FontWeightHelper.regular,
    color: Colors.white,
  );
  static TextStyle font14WhiteRegular = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
    color: Colors.white,
  );
  static TextStyle font14GreenRegular = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.mainGreen,
  );
  static TextStyle font22WhiteBold = TextStyle(
    fontSize: 22.sp,
    fontWeight: FontWeightHelper.bold,
    color: Colors.white,
  );
  static TextStyle font24BlackBold = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.bold,
    color: Colors.black,
  );
  static TextStyle font16BlackMedium = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.medium,
    color: Colors.black,
  );
  static TextStyle font14BlackMedium = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.medium,
    color: Colors.black.withOpacity(.4),
  );
}
