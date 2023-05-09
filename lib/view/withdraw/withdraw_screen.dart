

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tab_cash/core/components/custom_button.dart';
import 'package:tab_cash/core/constants/app_images.dart';
import 'package:tab_cash/core/styles/colors.dart';
import 'package:tab_cash/core/utils/enum.dart';
import 'package:tab_cash/view/withdraw/widgets/taps_withdraw.dart';
import 'package:tab_cash/view/withdraw/widgets/withdraw_steps.dart';

import '../../config/routes/routes.dart';
import '../../core/constants/text_poppins.dart';


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
            onPressed: (){
              Navigator.pop(context);
            },
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
    bool isFindAtm = withdrawType==WithdrawType.findATM;
    bool isWithdrawATM = withdrawType==WithdrawType.withdrawATM;
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
                  backgroundColor: isFindAtm?Colors.black:
                  const Color(0xFFF5F5F5),
                textColor:  isFindAtm?Colors.white:
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

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(AppImages.findAtm),
          ),
         isFindAtm? const CustomFindAtm():const CustomWithdrawAtm(),
          const SizedBox(height: 16.0,),
          customButton(context, color: AppColors.secondColor, label: 'Next',onTap: (){
            // nav to selected screen
            isFindAtm?Navigator.pushNamed(context, 'Maps Screen'):
            Navigator.pushNamed(context, Routes.addMoneyScreen);
          })

        ],
      ),
    );



  }
}

class CustomFindAtm extends StatelessWidget {
  const CustomFindAtm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

    const SizedBox(height: 16.0,),
    PoppinsText(text: 'To Find ATM',color: AppColors.secondColor,
      fontSize: 20.0,fontWeight: FontWeight.w600,),
        Padding(
          padding: const EdgeInsets.only(left: 56.0,top: 16.0),
          child: Column(
            children: const [
              WithdrawSteps(
                  stepNumber: 1,stepsTitle: 'Allow to determine location'),
               WithdrawSteps(stepNumber: 2,stepsTitle: 'Determine the nearest ATM'),
               WithdrawSteps(stepNumber: 3,stepsTitle: 'Get directions'),
               WithdrawSteps(stepNumber: 4,stepsTitle: 'Go to ATM'),
            ],
          ),
        ),



      ],
    );
  }
}


class CustomWithdrawAtm extends StatelessWidget {
  const CustomWithdrawAtm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PoppinsText(text: 'You can withdraw money from ATM',color: AppColors.secondColor,
          fontSize: 16.0,fontWeight: FontWeight.bold,),
        Padding(
          padding: const EdgeInsets.only(left: 56.0,top: 16.0),
          child: Column(
            children: const [
               WithdrawSteps(stepNumber: 1,stepsTitle: 'Add the amount that you want'),
               WithdrawSteps(stepNumber: 2,stepsTitle: 'Enter the password'),
               WithdrawSteps(stepNumber: 3,stepsTitle: 'Enter OTP on ATM '),

            ],
          ),
        ),


      ],
    );
  }
}
