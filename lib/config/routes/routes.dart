
import 'package:flutter/material.dart';
import 'package:tab_cash/view/success_screen/success_screen.dart';
import 'package:tab_cash/view/auth/login_screen.dart';
import 'package:tab_cash/view/auth/register_screen.dart';

import '../../view/onboarding_screen/onboarding_screen.dart';
import '../../view/splash_screen/splash_screen.dart';
class Routes{
  static const String splashScreen='/';
  static  const String onboardingScreen = '/onboardingScreen';
  static const String successScreen = '/successScreen';
  static const String loginScreen = '/loginScreen';
  static const String registerScreen = '/registerScreen';
}

class AppRoutes{
  static Route? onGenerateRoute(RouteSettings routeSettings){
    switch(routeSettings.name){
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (context)=>SplashScreen(),
            settings: routeSettings);
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