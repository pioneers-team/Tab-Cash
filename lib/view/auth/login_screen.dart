import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tab_cash/core/styles/colors.dart';

import '../../core/components/custom_TextField.dart';
import '../../core/components/custom_button.dart';

class LoginScreen extends StatelessWidget {

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      body: Center(
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
                    onTap:(){},
                    color: AppColors.secondColor,
                    label: "Login",
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don’t have an account?",
                        style: TextStyle(
                          color: AppColors.secondColor,
                          fontSize: 14,
                          //fontWeight: FontWeight.bold
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Sign Up",
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