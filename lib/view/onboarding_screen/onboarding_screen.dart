import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tab_cash/core/constants/app_images.dart';
import 'package:tab_cash/core/styles/colors.dart';
import 'package:tab_cash/view/onboarding_screen/widget/page_view_widget.dart';

import '../../config/routes/routes.dart';
import 'onboard_model.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final List<OnboardingModel> listOnboardData = [
    OnboardingModel(image: AppImages.trans2Svg,
        title: 'Transfer Money',
        description: 'Send money to anyone ,typically fast and secure, with transaction history stored in the app.'),

    OnboardingModel(image: AppImages.trans2Svg,
        title: 'Maps',
        description: 'Send money to anyone ,typically fast and secure, with transaction history stored in the app.'),
    OnboardingModel(image: AppImages.trans2Svg,
        title: 'Smart Card',
        description: "A physical card linked to the user's e-wallet account that can be used to make payments at merchants."),
    OnboardingModel(image: AppImages.trans2Svg,
        title: 'Parental Controls',
        description: "Allows parents to set a spending limit on their child's e-wallet account, view transaction history."),

  ];

  bool isLast = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.primary,
          onPressed: () {
            if (isLast) {
              // nav to login screen

      Navigator.pushReplacementNamed(context, Routes.loginScreen);

            } else {
              _controller.nextPage(duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut);
            }

          },
          child: const Icon(
            Icons.arrow_forward, color: Colors.white, size: 32,),
        ),
        body: Column(
          children: [

            InkWell
              (onTap: (){
                Navigator.pushNamedAndRemoveUntil(context, Routes.loginScreen, (route) => false);
            },
                child: Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text('Skip',style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                      color: AppColors.primary
                    ),),
                  ),
                )),

            Expanded(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) =>
                    PageViewWidget(onboardingData: listOnboardData[index],
                        ),

                scrollDirection: Axis.horizontal,
                onPageChanged: (int i) {
                  if ( i == listOnboardData.length-1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                controller: _controller,
                itemCount: listOnboardData.length,
              ),
            ),

            // smooth Page Indicator

            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 24.0,bottom: 32.0),
                child: SmoothPageIndicator(
                  controller: _controller,
                  count: listOnboardData.length,
                  effect: const ScrollingDotsEffect(
                      activeDotColor: AppColors.primary,
                    dotHeight: 13.0,
                    dotWidth: 13.0
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
