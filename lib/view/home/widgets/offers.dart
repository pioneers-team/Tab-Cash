import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:tab_cash/core/styles/colors.dart';

class Offers extends StatelessWidget {
  const Offers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: AppColors.secondColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "When you pay with tab cash",
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                color: AppColors.white,
                fontSize: 20
              ),
            ),
            Container(
              height: 50,
              width: 230,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: AppColors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "20 % off",
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        color: AppColors.secondColor,
                        fontSize: 20,
                      fontWeight: FontWeight.w700
                    ),
                  ),
                   //Icon(IconlyLight.activity,)
                  Image(
                    image: AssetImage(
                    "assets/images/amazon.png",
                  ),
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
