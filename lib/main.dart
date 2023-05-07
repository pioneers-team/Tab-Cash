import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tab_cash/config/routes/routes.dart';
import 'package:tab_cash/view/layout/layout_screen.dart';
import 'package:tab_cash/view_model/layout_cubit/layout_cubit.dart';

import 'core/share/bloc_observer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  // DioHelper.init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tab Cash',
        theme: ThemeData(
            primarySwatch: Colors.orange,
            cardTheme: CardTheme(),
            scaffoldBackgroundColor: const Color(0xFFF5F5F5),
            textTheme: TextTheme(
              displayMedium: GoogleFonts.poppins(),
            )
        ),
        // onGenerateRoute: AppRoutes.onGenerateRoute,
        home: LayoutScreen(),
      ),
    );
  }
}
