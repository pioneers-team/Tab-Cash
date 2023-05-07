import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tab_cash/core/styles/colors.dart';


class CustomTextField extends StatefulWidget {
  final String label;
  final Widget? prefixIcon;
  final TextInputType keyboardType;
  bool obscureText ;
  String? Function(String? val)? validate;
  final int? num;
  IconData? suffixIcon;
  TextEditingController ? controller = TextEditingController();
  CustomTextField({
     this.controller,
    required this.keyboardType,
    this.validate,
    this.obscureText =false,
    this.suffixIcon,
    required this.label,
    this.num,
     this.prefixIcon,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric( vertical: 5),
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          //border: Border.all(color: Colors.grey)
      ),
      child: TextFormField(
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        validator: widget.validate,
        obscureText:widget.obscureText,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 15.0,bottom: 15.0, left: 20 ),
            hintText: widget.label,
            hintStyle: GoogleFonts.poppins(),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: AppColors.primary),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Colors.red),
            ),

            suffixIcon:widget.suffixIcon != null ? IconButton(
              onPressed: (){
              setState(() {
                widget.obscureText = !widget.obscureText;
              });
            },color: Colors.black, icon:widget.obscureText? const Icon(Icons.visibility_outlined):const Icon(Icons.visibility_off_outlined),):null,
            //isDense: true,
            prefixIcon: widget.prefixIcon),
      ),
    );
  }
}