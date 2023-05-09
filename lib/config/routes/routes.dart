
import 'package:flutter/material.dart';
import 'package:tab_cash/view/child_profile/child_profile_screen.dart';
import 'package:tab_cash/view/dashboard/dashboard_screen.dart';
import 'package:tab_cash/view/home/home_screen.dart';
import 'package:tab_cash/view/success_screen/success_screen.dart';
import 'package:tab_cash/view/auth/login_screen.dart';
import 'package:tab_cash/view/auth/register_screen.dart';
import 'package:tab_cash/view/withdraw/add_money_screen.dart';
import 'package:tab_cash/view/withdraw/transfer_screen.dart';
import 'package:tab_cash/view/withdraw/withdraw_screen.dart';

import '../../view/layout/layout_screen.dart';
import '../../view/onboarding_screen/onboarding_screen.dart';
import '../../view/splash_screen/splash_screen.dart';
import '../../view/verification/verification_screen.dart';
class Routes{
  static const String splashScreen='/';
  static  const String onboardingScreen = '/onboardingScreen';
  static const String successScreen = '/successScreen';
  static const String homeScreen = '/homeScreen';
  static const String verificationScreen = '/verificationScreen';

  static const String loginScreen = '/loginScreen';
  static const String layoutScreen = '/layoutScreen';
  static const String registerScreen = '/registerScreen';
  static const String transferScreen = '/transferScreen';
  static const String addMoneyScreen = '/addMoneyScreen';
  static const String withdrawScreen = '/WithdrawScreen';
  static const String dashboardScreen = '/dashboardScreen';
  static const String childProfileScreen = '/childProfileScreen';

}

class AppRoutes{
  static Route? onGenerateRoute(RouteSettings routeSettings){
    switch(routeSettings.name){
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (context)=>SplashScreen(),
            settings: routeSettings,);
      case Routes.onboardingScreen:
        return MaterialPageRoute(builder: (context)=>const OnboardingScreen(),
            settings: routeSettings);
      case Routes.successScreen:
        return MaterialPageRoute(builder: (context)=>SuccessScreen(),
            settings: routeSettings);
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (context)=>LoginScreen(),
            settings: routeSettings);
      case Routes.registerScreen:
        return MaterialPageRoute(builder: (context)=>RegisterScreen(),
            settings: routeSettings);
      case Routes.transferScreen:
        return MaterialPageRoute(builder: (context)=>TransferScreen(),
            settings: routeSettings);
      case Routes.addMoneyScreen:
        return MaterialPageRoute(builder: (context)=>AddMoneyScreen(),
            settings: routeSettings);
      case Routes.withdrawScreen:
        return MaterialPageRoute(builder: (context)=>WithdrawScreen(),
            settings: routeSettings);
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (context)=>HomeScreen(),
            settings: routeSettings);
      case Routes.verificationScreen:
        return MaterialPageRoute(builder: (context)=>VerificationScreen(),
            settings: routeSettings);

      case Routes.layoutScreen:
        return MaterialPageRoute(builder: (context)=>LayoutScreen(),
            settings: routeSettings);
      case Routes.dashboardScreen:
        return MaterialPageRoute(builder: (context)=>DashboardScreen(),
            settings: routeSettings);
      case Routes.childProfileScreen:
        return MaterialPageRoute(builder: (context)=>ChildProfileScreen(),
            settings: routeSettings);



      default:
        return defaultScreen();
    }
  }
  static Route? defaultScreen(){
    return MaterialPageRoute(builder: (context)=>const Scaffold(
      body: Center(
        child: Text('please connect to Network'),
      ),
    ));
  }
}