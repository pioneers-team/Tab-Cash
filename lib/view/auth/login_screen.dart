import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tab_cash/core/styles/colors.dart';

import '../../core/components/custom_TextField.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Sign in to your account ",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                const Text(
                  "Enter your phone number and password",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
