import 'package:flutter/material.dart';

import '../../../../core/styles/colors.dart';
import '../../../../model/maps/places_suggestion.dart';


class PlaceItem extends StatelessWidget {
  final PlaceSuggestion suggestion;

  const PlaceItem({Key? key, required this.suggestion}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var subTitle = suggestion.description
        .replaceAll(suggestion.description.split(",")[0], "");
    return Container(
        width: double.infinity,
        margin: const EdgeInsetsDirectional.all(5),
        padding: const EdgeInsetsDirectional.all(4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.place, color: AppColors.primary),
              title: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "${suggestion.description.split(",")[0]}\n",
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: subTitle.substring(2),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}