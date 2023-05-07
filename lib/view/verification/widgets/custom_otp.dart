import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tab_cash/core/styles/colors.dart';


// Custom OTP Widget:

class Otp extends StatelessWidget {

  TextEditingController controller = TextEditingController();

   Otp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: TextFormField(

        controller: controller,
        keyboardType: TextInputType.number,
        style: Theme.of(context).textTheme.headline6,
        textAlign: TextAlign.center,

        cursorColor: AppColors.primary,

        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
          if (value.isEmpty) {
            FocusScope.of(context).previousFocus();
          }
        },
        decoration: const InputDecoration(
          hintText: ('0'),
          focusColor: AppColors.primary,
          fillColor: AppColors.primary,



        ),
        onSaved: (value) {},
      ),
    );
  }
}