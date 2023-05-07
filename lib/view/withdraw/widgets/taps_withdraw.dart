import 'package:flutter/material.dart';


class TapsWithdrawButton extends StatelessWidget {
  const TapsWithdrawButton({
    super.key,
    required this.title,
    required this.backgroundColor,
    required this.textColor,
    required this.function
  });

  final String title;
  final Color backgroundColor;
  final Function function;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
          function();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40.0,vertical: 14.0),
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(8.0)
        ),
        child:  Text(title,style: TextStyle(
            color: textColor
        ),),
      ),
    );
  }
}
