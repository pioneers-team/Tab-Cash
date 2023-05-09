import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tab_cash/core/components/custom_button.dart';
import 'package:tab_cash/core/utils/media_quary.dart';

import '../core/components/custom_text_field_money.dart';
import '../core/constants/text_poppins.dart';

class ChildPayment extends StatelessWidget {
   ChildPayment({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  PoppinsText(text: 'Child Payments ',letterSpacing: 0.6,
          color: Colors.black,fontSize: 24.0,fontWeight: FontWeight.w400,),
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
      body: GestureDetector(
        onTap: (){
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height:context.height*0.1),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Enter Product Link',style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 16.0,
                        fontWeight: FontWeight.bold
                      ),),
                      SizedBox(height: context.height* 0.05,),
                      CustomTextFieldMoney(
                        textInputType: TextInputType.url,
                          validator: (String? value) {
                            if(value!.isEmpty){
                              return "Please Enter URl ";
                            }
                          }, hintText: 'https://.................'),
                      SizedBox(height: context.height* 0.05,),
                      customButton(context, color: Colors.black, label: 'Pay',
                      onTap: (){
                        if(_formKey.currentState!.validate()){

                        }
                      })
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
