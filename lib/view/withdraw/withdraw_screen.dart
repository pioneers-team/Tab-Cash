

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tab_cash/core/components/custom_button.dart';
import 'package:tab_cash/core/constants/app_images.dart';
import 'package:tab_cash/core/styles/colors.dart';
import 'package:tab_cash/core/utils/enum.dart';
import 'package:tab_cash/view/withdraw/widgets/taps_withdraw.dart';
import 'package:tab_cash/view/withdraw/widgets/withdraw_steps.dart';


class WithdrawScreen extends StatefulWidget {
   WithdrawScreen({Key? key}) : super(key: key);

  @override
  State<WithdrawScreen> createState() => _WithdrawScreenState();
}

class _WithdrawScreenState extends State<WithdrawScreen> {
  // enum to select body screen content
  WithdrawType withdrawType = WithdrawType.findATM;

  @override
  Widget build(BuildContext context) {
    // Color(0xFFF5F5F5)
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title:  Text('Withdraw',
            style: GoogleFonts.poppins(
                letterSpacing: 0.6,
                fontSize: 24.0,
                color:Colors.black,
                fontWeight: FontWeight.w500),
          ),
          leading: IconButton(
            onPressed: (){},
            icon: const Icon(Icons.arrow_back_ios,),
          ),
          actions:  [IconButton(
            onPressed: (){

            },
             icon:const Icon( Icons.notifications_none_outlined,size: 25.0))],
        ),
        body: _withDrawBody(context),
      ),
    );
  }

  Widget _withDrawBody(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:  [
              TapsWithdrawButton(
                  title: 'Find ATM',
                  backgroundColor: withdrawType==WithdrawType.findATM?Colors.black:
                  const Color(0xFFF5F5F5),
                textColor:  withdrawType==WithdrawType.findATM?Colors.white:
          Colors.black,
                function: (){
                  if (withdrawType == WithdrawType.findATM) {
                    return;
                  }
                  setState(() {
                    withdrawType = WithdrawType.findATM;
                  });
                },
              ),
              TapsWithdrawButton(title: 'Withdraw ATM',
                function: (){
                  if (withdrawType == WithdrawType.withdrawATM) {
                    return;
                  }
                  setState(() {
                    withdrawType = WithdrawType.withdrawATM;
                  });
                },
                textColor:  withdrawType==WithdrawType.withdrawATM?Colors.white:
                  Colors.black,
                backgroundColor: withdrawType==WithdrawType.withdrawATM?Colors.black:
                const Color(0xFFF5F5F5),
              ),
            ],
          ),
          const SizedBox(height: 4.0,),
          Image.asset(AppImages.withdrawImg),

          withdrawType == WithdrawType.findATM?Text('To Find ATM',style: Theme.of(context).textTheme.displayMedium!.copyWith(
            color: AppColors.secondColor,
            fontWeight: FontWeight.w600,
            fontSize: 20.0

          ),):Text('You can withdraw money from ATM',style: Theme.of(context).textTheme.displayMedium!.copyWith(
              color: AppColors.secondColor,
              fontWeight: FontWeight.w600,
              fontSize: 16.0

          ),),

          withdrawType == WithdrawType.findATM?Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                WithdrawSteps(stepNumber: 1,stepsTitle: 'Allow to determine location'),
                WithdrawSteps(stepNumber: 2,stepsTitle: 'Determine the nearest ATM'),
                WithdrawSteps(stepNumber: 3,stepsTitle: 'Get directions'),
                WithdrawSteps(stepNumber: 4,stepsTitle: 'Go to ATM'),
              ],
            ):Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              WithdrawSteps(stepNumber: 1,stepsTitle: 'Add the amount that you want'),
              WithdrawSteps(stepNumber: 2,stepsTitle: 'Enter the password'),
              WithdrawSteps(stepNumber: 3,stepsTitle: 'Enter OTP on ATM '),
            ],
          ),

          const SizedBox(height: 16.0,),
          customButton(context, color: AppColors.secondColor, label: 'Next')

        ],
      ),
    );
  }
}

