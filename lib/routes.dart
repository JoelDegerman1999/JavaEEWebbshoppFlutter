import 'package:e_commerce/presentation/home/home_screen.dart';
import 'package:e_commerce/presentation/sign-in/sign_in_screen.dart';
import 'package:e_commerce/presentation/splash/splash_screen.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.pageRoute: (context) => SplashScreen(),
  SignInScreen.pageRoute: (context) => SignInScreen(),
  HomeScreen.pageRoute: (context) => HomeScreen(),
};
