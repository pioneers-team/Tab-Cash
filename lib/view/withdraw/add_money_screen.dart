import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:tab_cash/core/components/custom_button.dart';
import 'package:tab_cash/core/styles/colors.dart';
import 'package:tab_cash/view/withdraw/widgets/taps_withdraw.dart';

import '../../core/components/custom_text_field_money.dart';
import '../../core/constants/app_images.dart';

class AddMoneyScreen extends StatelessWidget {
   AddMoneyScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
            onPressed: (){
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios,),
          ),
          actions: const[
            Padding(
              padding:  EdgeInsets.only(right: 15.0),
              child: Icon(IconlyLight.notification),
            ),
          ],
        ),
        body: GestureDetector(
          onTap: (){
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 16.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
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
                          CustomTextFieldMoney(hintText: '00,000,00 ',validator: (String? value) {
                            if(value!.isEmpty){
                              return "Please fill the field";
                            }else if(  value.length < 2){
                              return "Your money is not enough";
                            }
                            else if(value.length > 5){
                              return 'Your money is too high';
                            }
                          },),
                          const SizedBox(height: 16.0,),
                          Text('Enter password',style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 16.0
                          ),),
                          const SizedBox(height: 16.0,),
                          CustomTextFieldMoney(
                            textInputType: TextInputType.visiblePassword,
                            obscureText: true,
                            hintText: '',validator: (String? value) {RegExp regex =
                          RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                          if (value!.isEmpty) {
                            return 'Please enter password';
                          } else {
                            if (!regex.hasMatch(value)) {
                              return 'Enter valid password';
                            } else {
                              return null;
                            }
                          }
                          },),
                          const SizedBox(height: 40.0,),
                        ],
                      ),
                    ),
                    customButton(
                        context,
                        color: AppColors.secondColor,
                        label: 'Next',
                      onTap: ()async{
                        if(_formKey.currentState!.validate()){
                          await  showOtpMessage(context);
                        }
                      }
                    ),
                  ],
                ),
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
                                Text('Sent successfully',style: GoogleFonts.poppins(
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
