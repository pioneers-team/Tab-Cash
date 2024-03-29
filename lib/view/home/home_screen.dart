import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:tab_cash/core/components/custom_current_balance.dart';
import 'package:tab_cash/view/home/widgets/main_feature.dart';
import 'package:tab_cash/view/home/widgets/offers.dart';
import 'package:tab_cash/core/components/custom_transaction.dart';

import '../../core/components/custom_row_text_widget.dart';
import '../../core/styles/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            // Current Balance Widget:
             const CurrentBalance(moneyAmount: 1550, currentBalance: 'Current Balance',),
            const SizedBox(
              height: 16.0,
            ),
            // ** Main Feature Widget :) **
            const MainFeature(),
            const SizedBox(
              height: 8.0,
            ),

            // Custom Row Widget :
            const Padding(
              padding: EdgeInsets.only(right: 8.0,left: 8.0),
              child: CustomRow(
                title: "Offers",
              ),
            ),

            // Offers :)
            const Offers(),
            const SizedBox(height: 8.0,),
            const Padding(
              padding: EdgeInsets.only(right: 8.0,left: 8.0),
              child: CustomRow(
                title: "Transactions",
              ),
            ),
            const SizedBox(
              height: 8.0,
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
                  SizedBox(height: 10.0,),
                  CustomTransaction(
                    transactionTitle: "Cash Withdrawal",
                    transactionAmount: "1000",
                    transactionDate: "May 3,2022 ",
                    transactionTime: "4:00 pm",
                    iconData: IconlyLight.arrow_down,
                    iconColor: Colors.red,
                  ),
                  SizedBox(height: 10.0,),
                  CustomTransaction(
                    transactionTitle: "Cash Withdrawal",
                    transactionAmount: "1000",
                    transactionDate: "May 3,2022 ",
                    transactionTime: "4:00 pm",
                    iconData: IconlyLight.arrow_down,
                    iconColor: Colors.red,
                  ),
                  SizedBox(height: 10.0,),
                  CustomTransaction(
                    transactionTitle: "Cash Withdrawal",
                    transactionAmount: "1000",
                    transactionDate: "May 3,2022 ",
                    transactionTime: "4:00 pm",
                    iconData: IconlyLight.arrow_down,
                    iconColor: Colors.red,
                  ),
                  SizedBox(height: 10.0,),
                  CustomTransaction(
                    transactionTitle: "Charge Wallet",
                    transactionAmount: "400",
                    transactionDate: "May 3,2022 ",
                    transactionTime: "4:00 pm",
                    iconData: IconlyLight.arrow_up,
                    iconColor: Colors.green,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

