
import 'package:flutter/material.dart';


import 'package:news_app/features/home/bottom_nav_home.dart';

class HomeBody extends StatelessWidget {

  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      
      bottomNavigationBar:  BottomNavHome(),
      body: Container(),
    );
  }
}
