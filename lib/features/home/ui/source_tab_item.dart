// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/theme/colors.dart';
import 'package:news_app/core/theme/styles.dart';
import '../data/models/sources_title_response.dart';

class SourceTabItem extends StatelessWidget {
  final bool isSelected;
  final SourcesTitle source;
  const SourceTabItem({
    super.key,
    required this.isSelected,
    required this.source,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8.sp),
      padding: EdgeInsets.symmetric(vertical: 5.sp, horizontal: 10.sp),
      decoration: isSelected
          ? BoxDecoration(
              color: ColorsManager.lightBlue,
              borderRadius: BorderRadius.circular(30),
            )
          : BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: ColorsManager.lightBlue,
                width: 2.w,
              )),
      child: Center(
        child: Text(
          textAlign: TextAlign.center,
          source.name.toString(),
          style: isSelected
              ? TextStyles.font14WhiteRegular
              : TextStyles.font14GreenRegular,
        ),
      ),
    );
  }
}
