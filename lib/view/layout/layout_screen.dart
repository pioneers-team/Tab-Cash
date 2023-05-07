import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/styles/colors.dart';
import '../../view_model/layout_cubit/layout_cubit.dart';


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
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Icon(Icons.notifications_none_rounded),
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
          drawer: Drawer(),
        );
      },
    );
  }
}
