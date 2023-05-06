import 'package:flutter/material.dart';
import 'package:tab_cash/core/components/custom_TextField.dart';

import '../../core/components/custom_button.dart';
import '../../core/styles/colors.dart';


class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SafeArea(
            child: Form(
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
                        width: MediaQuery.of(context).size.width/2.47,
                        child: CustomTextField(
                            keyboardType: TextInputType.text, label: "First Name"),
                      ),
                      const SizedBox(
                        width: 30.0,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width/2.4,
                        child: CustomTextField(
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

                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  CustomTextField(
                    label: 'Enter Phone Number',
                    keyboardType: TextInputType.phone,
                    iconData: Icons.ac_unit,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  CustomTextField(
                    keyboardType: TextInputType.text,
                    label: "Enter Password",
                    suffixIcon: Icons.visibility_outlined,
                  ),

                  const SizedBox(
                    height: 20.0,
                  ),
                  customButton(
                    context,
                    onTap:(){},
                    color: AppColors.secondColor,
                    label: "Continue",
                  ),

                  const SizedBox(
                    height: 8.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account?",
                        style: TextStyle(
                          color: AppColors.secondColor,
                          fontSize: 14,
                          //fontWeight: FontWeight.bold
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 16,
                            //fontWeight: FontWeight.bold
                          ),
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
    );
  }
}
