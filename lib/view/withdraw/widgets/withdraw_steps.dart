

import 'package:flutter/material.dart';

import '../../../core/styles/colors.dart';

class WithdrawSteps extends StatelessWidget {
  const WithdrawSteps({
    super.key,
    required this.stepsTitle,
    required this.stepNumber
  });

  final int stepNumber;
  final String stepsTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          CircleAvatar(
            backgroundColor: AppColors.primary,
            radius: 12,
            child: Text('$stepNumber',style: const TextStyle(color: Colors.white),),
          ),
          const SizedBox(width: 16.0,),
          Text(stepsTitle,style: const TextStyle(
              fontSize: 16.0,
              color: Colors.black
          ),)

        ],
      ),
    );
  }
}
