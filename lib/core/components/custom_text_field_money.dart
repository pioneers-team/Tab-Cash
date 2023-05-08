import 'package:flutter/material.dart';

class CustomTextFieldMoney extends StatelessWidget {
  CustomTextFieldMoney({
    super.key,
    required this.validator,
    required this.hintText
  });

  final String hintText;
  String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.center,
      validator: validator,

      keyboardType: TextInputType.number,
      decoration: InputDecoration(

        focusedBorder:OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: const BorderSide(color: Color(0xFFB2AFAF))
        ) ,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: const BorderSide(color: Color(0xFFB2AFAF))
        ),hintText: '00000',
        hintStyle: const TextStyle(
            color: Color(0xFF808080)
        ),
      ),
    );
  }
}
