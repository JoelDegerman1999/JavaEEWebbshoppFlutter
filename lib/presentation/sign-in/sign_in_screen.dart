import 'package:e_commerce/application/auth/sign_in/sign_in_bloc.dart';
import 'package:e_commerce/injection.dart';
import 'package:e_commerce/presentation/sign-in/components/sign_in_body.dart';
import 'package:e_commerce/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatelessWidget {
  static const pageRoute = "sign-in";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Center(
            child: Text(
          "Login",
          style: TextStyle(color: Colors.black),
        )),
      ),
      body: BlocProvider(
        create: (context) => getIt<SignInBloc>(),
        child: SignInBody(),
      ),
    );
  }
}
