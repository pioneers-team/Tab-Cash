import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:tab_cash/view/pay_bills/widget/custom_service.dart';

import '../../config/routes/routes.dart';
import '../../core/styles/colors.dart';
import 'model.dart';

class PayBillsScreen extends StatelessWidget {
  final List<BillsModel> mobileService = [
    BillsModel(title: "Vodafone", imageUrl: "assets/images/vodafone.png"),
    BillsModel(title: "Orange", imageUrl: "assets/images/orange.png"),
    BillsModel(title: "We", imageUrl: "assets/images/we.png"),
  ];
  final List<BillsModel> paymentService = [
    BillsModel(title: "Water", imageUrl: "assets/icons/water.png"),
    BillsModel(title: "Electricity", imageUrl: "assets/icons/electricity.png"),
    BillsModel(title: "Gas", imageUrl: "assets/icons/gas.png"),
    BillsModel(title: "Insurance", imageUrl: "assets/icons/Insurance.png"),
    BillsModel(title: "Online Games", imageUrl: "assets/icons/Online-games.png"),
    BillsModel(title: "ASDL", imageUrl: "assets/icons/adsl.png"),
    BillsModel(title: "Donation", imageUrl: "assets/icons/donation.png"),
    BillsModel(title: "Installment", imageUrl: "assets/icons/bitcoin.png"),
    BillsModel(title: "Clubs", imageUrl: "assets/icons/clubs.png"),

  ];

  PayBillsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pay Bills",
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              "Mobile Services",
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w400,
                    color: AppColors.secondColor,
                  ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
            CustomPayService(
                title: mobileService[0].title,
                imageUrl: mobileService[0].imageUrl),
            CustomPayService(
                title: mobileService[1].title,
                imageUrl: mobileService[1].imageUrl),
            CustomPayService(
                title: mobileService[2].title,
                imageUrl: mobileService[2].imageUrl),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                IconlyLight.arrow_right_2,
                size: 40,
              ),
            ),
          ]),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              "Payment Services",
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w400,
                    color: AppColors.secondColor,
                  ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: paymentService.length,
              itemBuilder: (context, i) {
                return CustomPayService(title: paymentService[i].title, imageUrl: paymentService[i].imageUrl);
              },
            ),
          )
        ],
      ),
    );
  }
}
