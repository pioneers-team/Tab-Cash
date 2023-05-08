import 'package:flutter/material.dart';

import '../drawer/my_drawer.dart';

class CardsScreen extends StatelessWidget {
  const CardsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      drawer: DrawerWidget(),
      body: Center(
        child: Text(
          "Cards Screen",
        ),
      ),
    );
  }
}
