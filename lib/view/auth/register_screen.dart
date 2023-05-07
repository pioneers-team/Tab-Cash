import 'package:flutter/material.dart';
import 'package:tab_cash/core/components/custom_TextField.dart';

import '../../config/routes/routes.dart';
import '../../core/components/custom_button.dart';
import '../../core/styles/colors.dart';


class RegisterScreen extends StatelessWidget {
   RegisterScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: SafeArea(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Text(
                        "Create an account",
                        style: Theme.of(context).textTheme.displayMedium!.copyWith(
                            color: AppColors.secondColor,
                            fontSize: 25,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        "Let’s get started with your e-wallet",
                        style: Theme.of(context).textTheme.displayMedium!.copyWith(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w700
                        ),
                      ),

                      const SizedBox(
                        height: 60.0,
                      ),
                      Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width/2.55,
                            child: CustomTextField(
                              validate: (String? value){
                                if(value!.isEmpty){
                                  return "Enter First Name";
                                }
                              },
                                keyboardType: TextInputType.text, label: "First Name"),
                          ),
                          const SizedBox(
                            width: 20.0,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width/2.28,
                            child: CustomTextField(
                                validate: (String? value){
                                  if(value!.isEmpty){
                                    return "Enter Last Name";
                                  }
                                },
                                keyboardType: TextInputType.text, label: "Last Name"),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),


                      // Text Form Field:::
                      CustomTextField(
                        keyboardType: TextInputType.number,
                        label: "Enter Your ID Number",
                        validate: (String? value){
                          if(value!.isEmpty){
                            return "Enter ID Number";
                          }
                        },

                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      CustomTextField(
                        validate: (String? value){
                          if(value!.isEmpty){
                            return "Please Enter Your Number";
                          }else if(value.length > 11 || value.length < 11){
                            return "Your Phone Number Is Wrong";
                          }
                        },
                        label: 'Enter Phone Number',
                        keyboardType: TextInputType.phone,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("assets/images/egypt.png",height: 10,width: 10,),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      CustomTextField(
                        validate: (String? value){
                          if(value!.isEmpty){
                            return "Enter Your Password Please";
                          }
                        },
                        keyboardType: TextInputType.text,
                        label: "Enter Password",
                        suffixIcon: Icons.visibility_outlined,
                      ),

                      const SizedBox(
                        height: 20.0,
                      ),
                      customButton(
                        context,
                        onTap:(){
                          if(formKey.currentState!.validate()){
                            print("*****SUCCESS****");
                          }
                        },
                        color: AppColors.secondColor,
                        label: "Register",
                      ),

                      const SizedBox(
                        height: 8.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                           Text(
                            "Already have an account?",
                            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                              fontSize: 14,
                              color: AppColors.secondColor

                            )
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamedAndRemoveUntil(context, Routes.loginScreen, (route) => false);
                            },
                            child:  Text(
                              "Login",
                              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                                fontSize: 16,
                                color: AppColors.primary

                              )
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
