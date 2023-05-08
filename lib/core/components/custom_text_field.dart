
import 'package:flutter/material.dart';



class customTextField extends StatelessWidget {
  const customTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          hintText: '',
          hintStyle: const TextStyle(
              color: Color(0xFF808080)
          ),
          focusedBorder:OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide: const BorderSide(color: Color(0xFFB2AFAF))
          ) ,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide: const BorderSide(color: Color(0xFFB2AFAF))
          )
      ),
    );
  }
}
