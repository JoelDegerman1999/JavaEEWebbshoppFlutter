import 'package:e_commerce/application/auth/auth_bloc.dart';
import 'package:e_commerce/hex_color.dart';
import 'package:e_commerce/presentation/home/home_screen.dart';
import 'package:e_commerce/presentation/sign-in/sign_in_screen.dart';
import 'package:e_commerce/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthNotAuthenticatedState) {
          Navigator.pushReplacementNamed(context, SignInScreen.pageRoute);
        } else if (state is AuthAuthenticatedState) {
          Navigator.pushReplacementNamed(context, HomeScreen.pageRoute);
        }
      },
      child: const _SplashWidget(),
    );
  }
}

class _SplashWidget extends StatelessWidget {
  const _SplashWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "E Commerce",
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(36),
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text("Welcome to my E Commerce, Lets Shop")
              ],
            ),
            const Spacer(),
            const CircularProgressIndicator(),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
