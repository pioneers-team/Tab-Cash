import 'package:flutter/material.dart';
import 'package:tab_cash/core/constants/app_images.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  var formKey = GlobalKey<FormState>();

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