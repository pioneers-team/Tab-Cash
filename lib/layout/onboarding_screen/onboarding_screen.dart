import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tab_cash/core/constants/app_images.dart';
import 'package:tab_cash/core/styles/colors.dart';

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
    OnboardingModel(image: AppImages.egLogo,
        title: 'Transfer Money',
        description: 'Send money to anyone ,typically fast and secure, with transaction history stored in the app.'),
    OnboardingModel(image: AppImages.transMoneySvg,
        title: 'Smart Card',
        description: "A physical card linked to the user's e-wallet account that can be used to make payments at merchants."),
    OnboardingModel(image: AppImages.transMoneySvg,
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
              print('done nav');
              Navigator.pushNamedAndRemoveUntil(context, 'Login.id', (route) {
                return false;
              });
            } else {
              _controller.nextPage(duration: const Duration(milliseconds: 800),
                  curve: Curves.easeIn);
            }

          },
          child: const Icon(
            Icons.arrow_forward, color: Colors.white, size: 32,),
        ),
        body: PageView.builder(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) =>
              PageViewWidget(onboardingData: listOnboardData[index],
                  controller: _controller),
          scrollDirection: Axis.horizontal,
          onPageChanged: (int i) {
            if (i == listOnboardData.length - 1) {
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


        ),
      ),
    );
  }
}

class PageViewWidget extends StatelessWidget {
  const PageViewWidget({
    super.key,
    required this.onboardingData,
    required PageController controller,
  }) : _controller = controller;

  final OnboardingModel onboardingData;
  final PageController _controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Center(child: SvgPicture.asset(onboardingData.image)),
          ),
          Text(onboardingData.title, style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 30.0,
            color: Colors.black,
          ),),
          Text(onboardingData.description, style: GoogleFonts.poppins(
            fontSize: 18.0,
            color: const Color(0xFF5F5E5E),
          ),),
          const SizedBox(height: 80.0,),
          SmoothPageIndicator(
            controller: _controller, count: 3,
            effect: const ExpandingDotsEffect(
                activeDotColor: AppColors.primary
            ),
          )
        ],
      ),
    );
  }
}
