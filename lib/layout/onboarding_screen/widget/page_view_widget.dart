import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../onboard_model.dart';


class PageViewWidget extends StatelessWidget {
  const PageViewWidget({
    super.key,
    required this.onboardingData,
    required PageController controller,
  }) ;

  final OnboardingModel onboardingData;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Center(child: Padding(
              padding: const EdgeInsets.only(top: 24.0,right: 16.0,left: 16.0),
              child: SvgPicture.asset(onboardingData.image),
            )),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.04,),
          Text(onboardingData.title, style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 30.0,
            color: Colors.black,
          ),),
          const SizedBox(height: 24.0,),
          Text(onboardingData.description, style: GoogleFonts.poppins(
            fontSize: 18.0,
            color: const Color(0xFF5F5E5E),
          ),),

        ],
      ),
    );
  }
}
