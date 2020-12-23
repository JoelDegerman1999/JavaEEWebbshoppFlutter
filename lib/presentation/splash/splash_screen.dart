import 'package:e_commerce/application/auth/auth_bloc.dart';
import 'package:e_commerce/injection.dart';
import 'package:e_commerce/presentation/splash/components/splash_body.dart';
import 'package:e_commerce/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  static const pageRoute = "/splash";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
      create: (context) =>
          getIt<AuthBloc>()..add(AuthCheckIfAuthenticatedEvent()),
      child: Scaffold(
        body: SplashBody(),
      ),
    );
  }
}
