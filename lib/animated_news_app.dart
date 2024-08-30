import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/theme/colors.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';

class AnimatedNewsApp extends StatelessWidget {
  final AppRouter appRouter;
  const AnimatedNewsApp({
    super.key,
    required this.appRouter,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRouter.generateRoute,
        theme: ThemeData.from(
          colorScheme: const ColorScheme.light(),
        ).copyWith(
          primaryColor: ColorsManager.lightBlue,
          scaffoldBackgroundColor: Colors.white,
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: <TargetPlatform, PageTransitionsBuilder>{
              TargetPlatform.android: ZoomPageTransitionsBuilder(),
            },
          ),
        ),
        initialRoute: Routes.homeScreen,
      ),
    );
  }
}
