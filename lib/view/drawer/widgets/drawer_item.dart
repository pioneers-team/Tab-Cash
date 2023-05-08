
import 'package:flutter/material.dart';


class DrawerItem extends StatelessWidget {
  const DrawerItem({
    super.key,
    required this.iconData,
     this.screenName,
    required this.label
  });

  final String label;
  final IconData iconData;
  final String? screenName ;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:  Icon(
        iconData,
        color: const Color(0xFF0E0E0C),
      ),
      title:  Text(label,style: const TextStyle(fontSize: 16.0),),
      onTap: () {
        Navigator.pushReplacementNamed(context, screenName!);
      },
    );
  }
}
