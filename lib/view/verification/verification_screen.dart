import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tab_cash/core/constants/app_images.dart';
import 'package:tab_cash/core/styles/colors.dart';
import 'package:tab_cash/view/verification/widgets/custom_otp.dart';

import '../../config/routes/routes.dart';
import '../../core/components/custom_button.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SvgPicture.asset(AppImages.verificationSvg),
            const SizedBox(height: 24.0,),
            Text('Verification',style: Theme.of(context).textTheme.displayMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black,fontSize: 22.0
            ),),
            const SizedBox(height: 16.0,),
            Column(
              children: [
                Text('Enter your 4 digit number that sent to',style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF9B9B9B),fontSize: 14.0
                ),),
                Text('+201093793223',style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF9B9B9B),fontSize: 14.0
                ),),
              ],
            ),

            SizedBox(
              height: 250,
              width: double.infinity,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Color(0xFFFFFBFB),
                margin: EdgeInsets.all(25.0),
                elevation: 5,  // Change this
                shadowColor: Colors.black12,

                child: Column(
                  children: [
                    SizedBox(height: 20,),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Otp(),
                            Otp(),
                            Otp(),
                            Otp(),
                          ],
                        )
                    ),
                    const SizedBox(height: 25.0,),
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0,left: 15,top: 15,bottom: 20.0),
                      child: customButton(
                        context,
                        onTap:(){
                          Navigator.pushReplacementNamed(context, Routes.successScreen);
                        },
                        color: AppColors.secondColor,
                        label: "Continue",
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 10.0,),
            Text('Re-send code in 30',style: Theme.of(context).textTheme.displayMedium!.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColors.primary,fontSize: 14.0
            ),)
          ],
        ),
      ),
    );
  }
}

