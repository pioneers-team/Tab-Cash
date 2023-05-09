import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:tab_cash/core/styles/colors.dart';
import '../../../config/routes/routes.dart';

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
            navRoutes: Routes.transferScreen,
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
            navRoutes: Routes.withdrawScreen,
            child: const Icon(
              IconlyLight.download,
              size: 35,
            ),
          ),
          featureWidget(
            context,
            navRoutes: '',
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
            child:const Image(image: AssetImage("assets/images/child_logo.png"),),
            navRoutes: '',
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
    required  String navRoutes
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      GestureDetector(
        onTap:(){
    Navigator.pushNamed(context, navRoutes);
  },
        child: Container(
          height: 66,
          width: 66,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: AppColors.primaryColorGray, width: 1),
            color: backgroundColor,
          ),
          child: child,
        ),
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
