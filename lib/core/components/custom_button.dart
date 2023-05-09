

import 'package:flutter/material.dart';

Widget customButton(context,{
  required Color color,
  required String label,
  VoidCallback? onTap,
}){
  double screenHeight = MediaQuery.of(context).size.height;
  double screenWidth = MediaQuery.of(context).size.width;
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: screenHeight / 13,
      width: screenWidth / 1.1,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15)),
      child:  Center(
        child: Text(
          label,
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w600

          )
        ),
      ),
    ),
  );
}