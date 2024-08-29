import 'package:flutter/material.dart';
import '../../features/home/home_screen.dart';
import 'routes.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
     
      
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) =>  const HomeScreen(),
          );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}