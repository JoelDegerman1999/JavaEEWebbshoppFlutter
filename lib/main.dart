import 'package:e_commerce/injection.dart';
import 'package:e_commerce/presentation/sign-in/sign_in_screen.dart';
import 'package:e_commerce/presentation/splash/splash_screen.dart';
import 'package:e_commerce/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: GoogleFonts.montserratTextTheme(),
          appBarTheme: const AppBarTheme(
            color: Colors.white,
            elevation: 0,
          )),
      initialRoute: SplashScreen.pageRoute,
      routes: routes,
    );
  }
}
