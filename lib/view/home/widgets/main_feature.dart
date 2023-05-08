import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:tab_cash/core/styles/colors.dart';

class MainFeature extends StatelessWidget {
  const MainFeature({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          featureWidget(
            context,
            backgroundColor: AppColors.primary,
            title: "Transfer",
            child: const Icon(
              IconlyLight.arrow_right,
              size: 35,
              color: AppColors.white,
            ),
          ),
          featureWidget(
            context,
            backgroundColor: AppColors.white,
            title: "Withdraw",
            child: const Icon(
              IconlyLight.download,
              size: 35,
            ),
          ),
          featureWidget(
            context,
            backgroundColor: AppColors.white,
            title: "Pay bills",
            child: const Icon(
              IconlyLight.document,
              size: 35,
            ),
          ),
          featureWidget(
            context,
            title: "Kids",
            backgroundColor: AppColors.white,
            child: const Icon(
              Icons.child_care_outlined,
              size: 45,
            ),
          ),
        ],
      ),
    );
  }
}

Widget featureWidget(
  BuildContext context, {
  Color backgroundColor = Colors.white,
  required Widget child,
  required String title,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        height: 66,
        width: 66,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: AppColors.primaryColorGray, width: 1),
          color: backgroundColor,
        ),
        child: child,
      ),
      const SizedBox(
        height: 10,
      ),
      Text(
        title,
        style: Theme.of(context)
            .textTheme
            .displayMedium!
            .copyWith(color: AppColors.secondColor, fontSize: 15),
      ),
    ],
  );
}
