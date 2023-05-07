import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tab_cash/core/constants/app_images.dart';
import 'package:tab_cash/core/styles/colors.dart';

import '../../config/routes/routes.dart';
import 'custom_clip_path.dart';
import 'mu_cliper.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{
  late AnimationController animationController;
  late Animation<double> imgAnimation;

@override
  void initState() {
  initAnimation();
    navigateToOnboardScreen();
    super.initState();
  }
  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:  Scaffold(
        backgroundColor: AppColors.secondColor,
        body: Stack(

          children: [
            ClipPath(
              clipper: myClipper(),
              child: Container(

                height: MediaQuery.of(context).size.height/3,
                decoration: BoxDecoration(
                    gradient:
                    LinearGradient(begin: Alignment.topLeft,end: Alignment.bottomCenter
                        , colors: [

                          Colors.black54,
                          Colors.grey.shade800,


                          // Color.fromARGB(255, 18, 4, 211),
                    ]),

                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient:
                LinearGradient(begin: Alignment.topCenter,end: Alignment.bottomRight
                    , colors: [
                      Colors.black54,
                      Colors.grey.shade800,
                      Colors.black54,


                      // Color.fromARGB(255, 18, 4, 211),
                    ]),


              ),
              child: Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                      ScaleTransition(
                        scale: imgAnimation,
                          child: SizedBox(
                            height: 300,
                              width: 300,
                              child: Center(child: Image.asset(AppImages.logo)))),

                ],
    ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ClipPath(
                clipper: myClipper2(),
                child: Container(
                  height: MediaQuery.of(context).size.height/2.2,
                  decoration: BoxDecoration(
                      gradient:
                      LinearGradient(begin: Alignment.topLeft,end: Alignment.bottomRight
                      , colors: [

                    Colors.grey.shade800,
                            Colors.black54,


                    // Color.fromARGB(255, 18, 4, 211),
                  ]),


                  ),
                ),
              ),
            ),
            // ClipPath(
            //   clipper: MyCustomClipper(),
            //   child: Container(
            //     // width: double.infinity,
            //     decoration: const BoxDecoration(
            //         color: Colors.blue
            //     ),
            //     height: heightDevice / 3,
            //     // width: double.infinity,
            //
            //   ),
            // ),
          ],
        ),
      )
    );
  }

  void initAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    );
    imgAnimation = CurvedAnimation(parent: animationController,
        curve: Curves.easeInOut);
    animationController.forward();
  }
  void navigateToOnboardScreen() {
    Future.delayed(const Duration(milliseconds: 3000), () {
      Navigator.pushNamed(context, Routes.onboardingScreen);
    });
  }

}