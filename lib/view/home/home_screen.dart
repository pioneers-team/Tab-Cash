import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:tab_cash/view/home/widgets/current_balance.dart';
import 'package:tab_cash/view/home/widgets/main_feature.dart';
import 'package:tab_cash/view/home/widgets/offers.dart';
import 'package:tab_cash/view/home/widgets/transaction.dart';

import '../../core/styles/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            // Current Balance Widget:
            const CurrentBalance(),
            const SizedBox(
              height: 40,
            ),
            // ** Main Feature Widget :) **
            const MainFeature(),
            const SizedBox(
              height: 25,
            ),

            // Custom Row Widget :
            Padding(
              padding: const EdgeInsets.only(right: 8.0,left: 8.0),
              child: const CustomRow(
                title: "Offers",
              ),
            ),

            // Offers :)
            const Offers(),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0,left: 8.0),
              child: const CustomRow(
                title: "Transactions",
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Expanded(
              child: ListView(

                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: const[
                  CustomTransaction(
                    transactionTitle: "Charge Wallet",
                    transactionAmount: "400",
                    transactionDate: "May 3,2022 ",
                    transactionTime: "4:00 pm",
                    iconData: IconlyLight.arrow_up,
                    iconColor: Colors.green,
                  ),
                  SizedBox(height: 10,),
                  CustomTransaction(
                    transactionTitle: "Cash Withdrawal",
                    transactionAmount: "1000",
                    transactionDate: "May 3,2022 ",
                    transactionTime: "4:00 pm",
                    iconData: IconlyLight.arrow_down,
                    iconColor: Colors.red,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
          "View all",
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
              color: AppColors.primaryColorGray,
              fontSize: 17,
              fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
