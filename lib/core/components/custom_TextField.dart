import 'package:flutter/material.dart';


class CustomTextField extends StatefulWidget {
  final String label;
  final IconData? iconData;
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
     this.iconData,
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
          border: Border.all(color: Colors.grey)
      ),
      child: TextFormField(
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        validator: widget.validate,
        obscureText:widget.obscureText,
        decoration: InputDecoration(
            hintText: widget.label,
            hintStyle: const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
            //suffixIcon: Icon(Icons.email,color: kColor),
            border: InputBorder.none,

            suffixIcon:widget.suffixIcon != null ? IconButton(
              onPressed: (){
              setState(() {
                widget.obscureText = !widget.obscureText;
              });
            },color: Colors.black, icon:widget.obscureText? const Icon(Icons.visibility_outlined):const Icon(Icons.visibility_off_outlined),):null,
            //isDense: true,
            prefixIcon: Icon(widget.iconData, color: Colors.black)),
      ),
    );
  }
}