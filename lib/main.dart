import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'layout/splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tab Cash',
      theme: ThemeData(
        cardTheme: CardTheme(),
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
        textTheme: TextTheme(
          displayMedium: GoogleFonts.poppins(),
        )
      ),
      home:  SplashScreen(),
    );
  }
}
