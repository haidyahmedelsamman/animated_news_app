import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/theme/colors.dart';
import 'package:news_app/core/theme/styles.dart';
import '../logic/cubit/home_cubit.dart';
import '../logic/cubit/home_state.dart';
import 'news_screen.dart';
import 'search_text_field.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listenWhen: (previous, current) =>
          current is HomeLoading ||
          current is HomeSuccess ||
          current is HomeSearch ||
          current is HomeStopSearch ||
          current is HomeError,
      listener: (context, state) {},
      builder: (context, state) {
        final isSearching = context.read<HomeCubit>().isSearching;

        return Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 70.h,
            elevation: 0,
            iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: ColorsManager.lightBlue,
            actions: isSearching
                ? [] // No actions when searching
                : [
                    Padding(
                      padding: EdgeInsets.only(right: 20.0, bottom: 4.sp),
                      child: GestureDetector(
                        onTap: () {
                          context.read<HomeCubit>().emitStartSearching();
                        },
                        child: Image.asset(
                          "assets/images/icon_search.png",
                          height: 28.h,
                          width: 28.w,
                        ),
                      ),
                    ),
                  ],
            title: AnimatedSwitcher(
              // switchInCurve: Curves.bounceIn,
              // switchOutCurve: Curves.bounceOut,
              duration: const Duration(seconds: 2), // Smooth animation duration
              transitionBuilder: (Widget child, Animation<double> animation) {
                return ScaleTransition(
                  scale: CurvedAnimation(
                    parent: animation,
                    curve: Curves
                        .bounceInOut, // Use bounceInOut curve for bounce effect
                  ),
                  child: child,
                );
              },
              child: isSearching
                  ? const SearchTextField(key: ValueKey('search'))
                  : null,
            ),
            flexibleSpace: Center(
              child: AnimatedContainer(
                duration: const Duration(seconds: 2),
                curve: Curves.bounceInOut,
                height: isSearching ? 40.h : 60.h,
                child: isSearching
                    ? null
                    : Padding(
                        padding: EdgeInsets.only(top: 12.sp),
                        child: Center(
                          child: Text(
                            "News App",
                            style: TextStyles.font20WhiteRegular,
                          ),
                        ),
                      ),
              ),
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(50),
              ),
            ),
          ),
          body: NewsScreen(
            categoryModel: context.read<HomeCubit>().selectedCategory,
          ),
        );
      },
    );
  }
}
