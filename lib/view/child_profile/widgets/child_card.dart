import 'package:flutter/material.dart';

import '../../../core/components/custom_current_balance.dart';
import '../../../core/styles/colors.dart';

class CustomChildCard extends StatelessWidget {
  const CustomChildCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(25)
      ),
      padding: const EdgeInsets.only(top: 20.0),
      
      child: Row(
        children:  [
          Expanded(
            flex: 1,
            child: Column(
              children:  [
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: AppColors.primary,
                  backgroundImage: AssetImage("assets/images/child.png"),
                ),
                const SizedBox(height: 10,),
                Text(
                  "Age: 10",
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontSize: 12,
                    color: AppColors.white
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            flex: 2,
            child: Column( 
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Name: Zayn",
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      fontSize: 12,
                      color: AppColors.white
                  ),
                ),
                Text(
                  "College savings",
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      fontSize: 12,
                      color: AppColors.white
                  ),
                ),
                const SizedBox(height: 10,),
                const CurrentBalance(
                  moneyAmount: 1000,
                  currentBalance: 'Current Limit',
                  moneyAmountSize: 34.0,
                  moneyAmountColor: AppColors.white,
                  currentBalanceColor: AppColors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

