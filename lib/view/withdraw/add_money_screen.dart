import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tab_cash/core/components/custom_button.dart';
import 'package:tab_cash/core/styles/colors.dart';
import 'package:tab_cash/view/withdraw/widgets/taps_withdraw.dart';

import '../../core/constants/app_images.dart';

class AddMoneyScreen extends StatelessWidget {
  const AddMoneyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            title:  Text('Add amount',
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
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 8.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:  [
                      TapsWithdrawButton(
                        title: 'Find ATM',
                        backgroundColor:
                        const Color(0xFFF5F5F5),
                        textColor:
                        Colors.black,
                        function: (){
                        },
                      ),
                      TapsWithdrawButton(title: 'Withdraw ATM',
                        function: (){

                        },
                        textColor: Colors.white,
                        backgroundColor: Colors.black

                      ),
                    ],
                  ),
                  const SizedBox(height: 24.0,),
                  Center(child: Image.asset(AppImages.withdrawImg)),
                  const SizedBox(height: 24.0,),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Add amount',style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 16.0
                        ),),
                       const SizedBox(height: 16.0,),
                        TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: '                          00,000,00 ',
                            hintStyle: const TextStyle(
                              color: Color(0xFF808080)
                            ),
                            focusedBorder:OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.0),
                                borderSide: const BorderSide(color: Color(0xFFB2AFAF))
                            ) ,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.0),
                              borderSide: const BorderSide(color: Color(0xFFB2AFAF))
                            )
                          ),
                        ),
                        const SizedBox(height: 16.0,),
                        Text('Enter password',style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 16.0
                        ),),
                        const SizedBox(height: 16.0,),
                        TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              focusedBorder:OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                  borderSide: const BorderSide(color: Color(0xFFB2AFAF))
                              ) ,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                  borderSide: const BorderSide(color: Color(0xFFB2AFAF))
                              ),
                          ),
                        ),
                        const SizedBox(height: 40.0,),
                      ],
                    ),
                  ),
                  customButton(
                      context,
                      color: AppColors.secondColor,
                      label: 'Next',
                    onTap: ()async{
                      await  showOtpMessage(context);
                    }
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> showOtpMessage(BuildContext context) {
    return showDialog(context: context, builder: (context) =>AlertDialog(
                      backgroundColor: Colors.white,
                      content: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(AppImages.alert),
                           const SizedBox(height: 16.0,),
                            Row(
                              children: [
                                const CircleAvatar(
                                  radius: 12.0,
                                  backgroundColor: Colors.orange,
                                  child: Icon(Icons.check,color: Colors.white,),
                                ),
                                const SizedBox(width: 8.0,),
                                Text('OTP sent successfuly',style: GoogleFonts.poppins(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.bold,


                                ),)
                              ],
                            )
                          ],
                        ),
                      ),
                    ) ,);
  }
}
