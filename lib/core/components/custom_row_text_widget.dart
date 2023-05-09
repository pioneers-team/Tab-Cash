import 'package:flutter/material.dart';

import '../styles/colors.dart';

// This widget used many times in HomeScreen, Dashboard and ChildrenProfile


class CustomRow extends StatelessWidget {
  final String title;

  const CustomRow({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
              color: AppColors.secondColor,
              fontSize: 23,
              fontWeight: FontWeight.w500),
        ),
        Text(
          "View All",
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
              color: AppColors.primaryColorGray,
              fontSize: 17,
              fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}