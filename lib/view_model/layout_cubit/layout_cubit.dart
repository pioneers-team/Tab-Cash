import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meta/meta.dart';

import '../../view/cards/cards_screen.dart';
import '../../view/home/home_screen.dart';
import '../../view/profile/profile_screen.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(LayoutInitialState());

  static LayoutCubit get(context)=> BlocProvider.of(context);

  // bottom navigation bar logic:
  int currentIndex = 0;
  void changeBottomNavBar(int index){
    currentIndex = index;
    emit(ChangeBottomNavBarState());
  }

  List<String> appBarTitle = [
    "Home",
    "Smart Cards",
    "Profile",

  ];

  List<Widget> screens = [
    const HomeScreen(),
    const CardsScreen(),
    const ProfileScreen(),
  ];

  List<BottomNavigationBarItem> bottomNavItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined),
      label: "Home",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.wallet),
      label: "Cards",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.perm_identity_rounded),
      label: "Profile",
    ),

  ];







}
