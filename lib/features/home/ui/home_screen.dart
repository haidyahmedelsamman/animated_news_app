import 'package:flutter/material.dart';
import 'package:news_app/features/home/ui/bottom_nav_home.dart';
import 'package:news_app/features/home/ui/home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: const HomeBody(),
      bottomNavigationBar: BottomNavHome(),
    );
  }
}
