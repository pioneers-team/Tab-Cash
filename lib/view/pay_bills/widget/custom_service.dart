import 'package:flutter/material.dart';

import '../../../core/styles/colors.dart';

class CustomPayService extends StatelessWidget {
  final String title;
  final String imageUrl;


  const CustomPayService(
      {Key? key, required this.title, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 88,
          width: 88,

          decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(50.0),
              border: Border.all(color: AppColors.primaryColorGray)),
          child: Center(child: Image(image: AssetImage(imageUrl))),
        ),
        const SizedBox(height: 5,),
        Text(
          title,
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
            fontSize: 13,
            color: AppColors.secondColor,
          ),
        ),
      ],
    );
  }
}