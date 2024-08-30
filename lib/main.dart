import 'package:flutter/material.dart';
import 'package:news_app/animated_news_app.dart';

import 'core/di/dependency_injection.dart';
import 'core/routing/app_router.dart';

void main() {
  setupGetIt();
  runApp(AnimatedNewsApp(
    appRouter: AppRouter(),
  ));
}
