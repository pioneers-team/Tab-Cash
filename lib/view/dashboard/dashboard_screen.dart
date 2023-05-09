import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:tab_cash/config/routes/routes.dart';
import 'package:tab_cash/core/components/custom_button.dart';
import 'package:tab_cash/view/layout/layout_screen.dart';

import '../../core/components/custom_transaction.dart';
import '../../core/styles/colors.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Dashboard",
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
              fontSize: 24.0,
              fontWeight: FontWeight.w400,
              color: AppColors.secondColor),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
                context, Routes.layoutScreen, (route) => false);
          },
          icon: Icon(
            IconlyLight.arrow_left_2,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const SizedBox(
              height: 60.0,
            ),
            customButton(
              context,
              color: AppColors.secondColor,
              label: "Child payments",
              onTap: () {},
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 8.0, left: 8.0),
              child: CustomRow(
                title: "Transactions",
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: const [
                  CustomTransaction(
                    transactionTitle: "Charge Wallet",
                    transactionAmount: "400",
                    transactionDate: "May 3,2022 ",
                    transactionTime: "4:00 pm",
                    iconData: IconlyLight.arrow_up,
                    iconColor: Colors.green,
                  ),
                  SizedBox(
                    height: 10,
                  ),
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
