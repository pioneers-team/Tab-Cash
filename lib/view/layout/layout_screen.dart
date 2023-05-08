import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconly/iconly.dart';

import '../../core/styles/colors.dart';
import '../../view_model/layout_cubit/layout_cubit.dart';
import '../drawer/my_drawer.dart';


class LayoutScreen extends StatelessWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = LayoutCubit.get(context);
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.transparent,
            elevation: 0.0,
            title: Text(
                cubit.appBarTitle[cubit.currentIndex],
              style:  Theme.of(context).textTheme.displayMedium!.copyWith(
                fontSize: 25.0,
                color: AppColors.secondColor
              ),
            ),
            actions: const[
              Padding(
                padding:  EdgeInsets.only(right: 15.0),
                child: Icon(IconlyLight.notification),
              ),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            elevation: 2,
            currentIndex: cubit.currentIndex,
            unselectedItemColor: AppColors.primaryColorGray,
            selectedItemColor: AppColors.primary,
            onTap: (index) {
              cubit.changeBottomNavBar(index);
            },
            type: BottomNavigationBarType.fixed,
            iconSize: 30,
            items: cubit.bottomNavItems,
          ),
          drawer: const DrawerWidget(),
        );
      },
    );
  }
}
