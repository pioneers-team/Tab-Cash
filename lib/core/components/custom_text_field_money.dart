import 'package:flutter/material.dart';

class CustomTextFieldMoney extends StatelessWidget {
  CustomTextFieldMoney({
    super.key,
    required this.validator,
    required this.hintText,
    this.obscureText=false,
    this.textInputType = TextInputType.number,
    this.controller
  });

  final String hintText;
   TextEditingController? controller;
  final bool obscureText;
  TextInputType textInputType;
  String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textAlign: TextAlign.center,
      validator: validator,
      obscureText: obscureText,
      keyboardType: textInputType,
      decoration: InputDecoration(
        focusedBorder:OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: const BorderSide(color: Color(0xFFB2AFAF))
        ) ,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: const BorderSide(color: Color(0xFFB2AFAF))
        ),hintText: hintText,
        hintStyle: const TextStyle(
            color: Color(0xFF808080)
        ),
      ),
    );
  }
}
