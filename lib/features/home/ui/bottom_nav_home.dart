import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/theme/colors.dart';
import 'package:news_app/features/home/logic/cubit/home_cubit.dart';

class BottomNavHome extends StatelessWidget {
  BottomNavHome({
    super.key,
  });
  //int _page = 0;

  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      onTap: (index) {
        context.read<HomeCubit>().selectedCategory = index;
        context.read<HomeCubit>().emitCategory(index);

        context
            .read<HomeCubit>()
            .emitGetArticals(index, context.read<HomeCubit>().sourceName);
        context.read<HomeCubit>().emitGetSourcesTitle();
      },
      height: 75,
      key: _bottomNavigationKey,
      index: context.read<HomeCubit>().selectedCategory,
      backgroundColor: Colors.transparent,
      items: <Widget>[
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
            'assets/images/business.png',
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
            'assets/images/technology.png',
            height: 40.h,
          ),
        )
      ],
      color: ColorsManager.lightBlue,
      buttonBackgroundColor: Colors.transparent,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 600),
      letIndexChange: (index) => true,
    );
  }
}
