import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tab_cash/core/constants/app_images.dart';
import 'package:tab_cash/layout/onboarding_screen/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
@override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const OnboardingScreen(),));
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double heightDevice = MediaQuery.of(context).size.height;
    double widthDevice = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Center(child: Image.asset(AppImages.logo)),
          ],
        ),
      ),
    );
  }
}