import 'package:flutter/material.dart';
import 'package:tab_cash/core/styles/colors.dart';

class CurrentBalance extends StatelessWidget {
  const CurrentBalance({Key? key}) : super(key: key);

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
                color: AppColors.secondColor,
                fontWeight: FontWeight.bold,
                fontSize: 45),
            children:  <TextSpan>[
              TextSpan(
                text: '1550.',
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: AppColors.secondColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 45
                ),
              ),
              TextSpan(
                text: '00',
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: AppColors.secondColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                ),
              )
            ],
          ),
        ),
        Row(
          children: [
            const Icon(
              Icons.visibility_outlined,
              color: AppColors.primaryColorGray,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              "Current Balance",
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  color: AppColors.primaryColorGray,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            )
          ],
        ),
      ],
    );
  }
}
