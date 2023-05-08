import 'package:flutter/material.dart';
import 'package:tab_cash/core/styles/colors.dart';

class CustomTransaction extends StatelessWidget {
  final String transactionTitle;
  final String transactionAmount;
  final String transactionDate;
  final String transactionTime;
  final IconData iconData;
  final Color iconColor;

  const CustomTransaction(
      {Key? key,
      required this.transactionTitle,
      required this.transactionAmount,
      required this.transactionDate,
      required this.transactionTime,
      required this.iconData,
        required this.iconColor,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: AppColors.primary,
      child: Row(
        children: [
          Container(
            height: 66,
            width: 66,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: AppColors.primaryColorGray, width: 1),
              //color: backgroundColor,
            ),
            child: Icon(
              iconData,
              color: iconColor,
              size: 40,
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                transactionTitle,
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      fontSize: 19,
                      color: AppColors.secondColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Row(
                children: [
                  Text(
                    transactionDate,
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        fontSize: 12, color: AppColors.primaryColorGray),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    transactionTime,
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        fontSize: 12, color: AppColors.primaryColorGray),
                  ),
                ],
              )
            ],
          ),
          Spacer(),
          Text(
            "EGP $transactionAmount",
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  fontSize: 22.0,
                  color: AppColors.secondColor,
                ),
          ),
        ],
      ),
    );
  }
}
