import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:tab_cash/core/styles/colors.dart';

class CurrentBalance extends StatelessWidget {
  final int moneyAmount;
  final String currentBalance;
   final double moneyAmountSize ;
   final Color moneyAmountColor;
   final Color currentBalanceColor;

  const CurrentBalance({Key? key, required this.moneyAmount, required this.currentBalance, this.moneyAmountSize = 45,  this.moneyAmountColor = AppColors.secondColor,  this.currentBalanceColor= AppColors.primaryColorGray} ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Your Money :)
        RichText(
          text: TextSpan(
            text: 'EGP ',
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                color: moneyAmountColor,
                fontWeight: FontWeight.bold,
                fontSize: moneyAmountSize,
            ),
            children:  <TextSpan>[
              TextSpan(
                text: '$moneyAmount',
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: moneyAmountColor,
                    fontWeight: FontWeight.bold,
                    fontSize: moneyAmountSize
                ),
              ),
              TextSpan(
                text: '.00',
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: moneyAmountColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                ),
              )
            ],
          ),
        ),
        Row(
          children: [
             Icon(
              IconlyLight.show,
              color: currentBalanceColor,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              currentBalance,
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  color: currentBalanceColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            )
          ],
        ),
      ],
    );
  }
}
