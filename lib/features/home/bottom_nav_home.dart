import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/theme/colors.dart';

class BottomNavHome extends StatelessWidget {
  BottomNavHome({super.key});
  //int _page = 0;

  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      height: 75,
      key: _bottomNavigationKey,
      index: 0,
      backgroundColor: Colors.white,
      items: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Image.asset(
            'assets/images/sports.png',
            height: 40.h,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Image.asset(
            'assets/images/health.png',
            height: 40.h,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Image.asset(
            'assets/images/science.png',
            height: 40.h,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Image.asset(
            'assets/images/bussines.png',
            height: 40.h,
          ),
        )
      ],
      color: ColorsManager.mainGreen,
      buttonBackgroundColor: Colors.transparent,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 600),
      onTap: (index) {},
      letIndexChange: (index) => true,
    );
  }
}
