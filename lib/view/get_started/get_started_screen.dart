import 'package:flutter/material.dart';
import 'package:tab_cash/core/styles/colors.dart';

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
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: screenHeight / 13,
                      width: screenWidth / 1.2,
                      decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(15)),
                      child: const Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
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
                        onPressed: () {},
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
