import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:tab_cash/core/components/custom_button.dart';
import 'package:tab_cash/core/components/custom_row_text_widget.dart';
import 'package:tab_cash/view/child_profile/widgets/child_card.dart';

import '../../config/routes/routes.dart';
import '../../core/components/custom_transaction.dart';
import '../../core/styles/colors.dart';

class ChildProfileScreen extends StatelessWidget {
  const ChildProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "My Children",
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                fontSize: 24.0,
                fontWeight: FontWeight.w400,
                color: AppColors.secondColor),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, Routes.dashboardScreen, (route) => false);
            },
            icon: const Icon(
              IconlyLight.arrow_left_2,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              const CustomChildCard(),
              const SizedBox(
                height: 10,
              ),
              const CustomRow(title: "Payment History"),
              const SizedBox(
                height: 12,
              ),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: const [
                    CustomTransaction(
                      transactionTitle: "Pubg Game",
                      transactionAmount: "200",
                      transactionDate: "May 10,2022 ",
                      transactionTime: "11:00 pm",
                      iconData: IconlyLight.arrow_down,
                      iconColor: Colors.red,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    CustomTransaction(
                      transactionTitle: "Kidzania Game",
                      transactionAmount: "100",
                      transactionDate: "May 12,2022 ",
                      transactionTime: "9:00 pm",
                      iconData: IconlyLight.arrow_down,
                      iconColor: Colors.red,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    CustomTransaction(
                      transactionTitle: "Clash of clans Game",
                      transactionAmount: "150",
                      transactionDate: "May 20,2022 ",
                      transactionTime: "10:00 am",
                      iconData: IconlyLight.arrow_down,
                      iconColor: Colors.red,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    CustomTransaction(
                      transactionTitle: "GTA IV Game",
                      transactionAmount: "300",
                      transactionDate: "May 25,2022 ",
                      transactionTime: "10:00 pm",
                      iconData: IconlyLight.arrow_down,
                      iconColor: Colors.red,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    CustomTransaction(
                      transactionTitle: " Football online",
                      transactionAmount: "300",
                      transactionDate: "May 25,2022 ",
                      transactionTime: "10:00 pm",
                      iconData: IconlyLight.arrow_down,
                      iconColor: Colors.red,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                  ],
                ),
              ),

              customButton(
                context,
                color: AppColors.secondColor,
                label: "Go to payments",
              ),
              const SizedBox(
                height: 18,
              ),
            ],
          ),
        ));
  }
}
