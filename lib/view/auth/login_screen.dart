import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tab_cash/core/styles/colors.dart';
import '../../config/routes/routes.dart';
import '../../core/components/custom_TextField.dart';
import '../../core/components/custom_button.dart';

class LoginScreen extends StatelessWidget {

   LoginScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
     // FocusManager.instance.primaryFocus?.unfocus();
    },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          physics:const BouncingScrollPhysics(),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: SafeArea(
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Sign in to your account ",
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
                        "Enter your phone number and password",
                        style: Theme.of(context).textTheme.displayMedium!.copyWith(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w700
                        ),
                      ),

                      const SizedBox(
                        height: 70.0,
                      ),

                      // Text Form Field:::

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
                            return "Please Enter Your Password";
                          }
                        },
                        keyboardType: TextInputType.text,
                        label: "Enter Password",
                        suffixIcon: Icons.visibility_outlined,

                      ),

                      Align(
                        alignment: Alignment.bottomRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Forget Password?",
                            style:Theme.of(context).textTheme.displayMedium!.copyWith(
                                color: AppColors.primary,
                                fontSize: 15,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      customButton(
                        context,
                        onTap:(){
                          if(formKey.currentState!.validate()){
                            log("*****SUCCESS****");
                            Navigator.pushReplacementNamed(context, Routes.layoutScreen);
                          }
                        },
                        color: AppColors.secondColor,
                        label: "Login",
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                           Text(
                            "Don’t have an account?",
                            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                              fontSize: 14,

                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamedAndRemoveUntil(context, Routes.registerScreen, (route) => false);
                            },
                            child:  Text(
                              "Sign Up",
                              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                                fontSize: 14,
                                color: AppColors.primary,
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
