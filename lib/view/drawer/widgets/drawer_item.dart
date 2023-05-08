
import 'package:flutter/material.dart';


class DrawerItem extends StatelessWidget {
  const DrawerItem({
    super.key,
    required this.iconData,
    required this.function,
    required this.label
  });

  final String label;
  final IconData iconData;
  final Function function;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:  Icon(
        iconData,
        color:Theme.of(context).colorScheme.secondary,

      ),
      title:  Text(label,style: const TextStyle(fontSize: 20.0),),
      onTap: () {
        function();
      },
    );
  }
}
