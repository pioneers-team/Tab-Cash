import 'package:flutter/material.dart';
import 'package:tab_cash/core/components/custom_button.dart';
import 'package:tab_cash/core/styles/colors.dart';

import '../../config/routes/routes.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.secondColor,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            child: Image(
              fit: BoxFit.contain,
              image: AssetImage(
                "assets/images/smart card.png",
              ),
            ),
          ),
          Expanded(
            child: Container(
              // width: screenWidth,
              // height: screenHeight / 1.97,
              color: AppColors.secondColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Get Started",
                    style: TextStyle(
                        color: AppColors.white,
                        fontSize: 34,
                        fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "The easy and secure way to make payments\n and manage your finances from anywhere",
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 16,
                      //fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(
                    height: 45.0,
                  ),
                  customButton(
                    context,
                    onTap:(){
                      Navigator.pushNamedAndRemoveUntil(
                          context,
                          Routes.loginScreen,
                              (route) => false);
                    },
                    color: AppColors.primary,
                    label: "Login",
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don’t have an account?",
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 14,
                          //fontWeight: FontWeight.bold
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context,
                              Routes.registerScreen,
                                  (route) => false);
                        },
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 16,
                            //fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
