

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tab_cash/core/constants/app_images.dart';
import 'package:tab_cash/core/styles/colors.dart';

import '../../config/routes/routes.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2),() => Navigator.pushReplacementNamed(context, Routes.layoutScreen),);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.transparent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Success!',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.w600,
                fontSize: 28.0
            ),),
          const SizedBox(height: 18.0,),
          Text('Welcome to Tab Cash',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 28.0
            ),),
          SizedBox(height:MediaQuery.of(context).size.height*0.1,),

          SvgPicture.asset(AppImages.doneSvg),
          const SizedBox(height: 16.0,),
          Text('You are logged in successfully',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                color: AppColors.primary,
                fontSize: 18.0,
                fontWeight: FontWeight.bold
            ),),
        ],
      ),
    ));
  }
}
