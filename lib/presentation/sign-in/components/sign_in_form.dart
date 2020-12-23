import 'package:e_commerce/application/auth/sign_in/sign_in_bloc.dart';
import 'package:e_commerce/presentation/home/home_screen.dart';
import 'package:e_commerce/presentation/sign-in/sign_in_screen.dart';
import 'package:e_commerce/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({
    Key key,
  }) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    return BlocConsumer<SignInBloc, SignInState>(
      listener: (context, state) {
        if (state is SignInLoggedInState) {
          Navigator.pushReplacementNamed(context, HomeScreen.pageRoute);
        } else if (state is SignInErrorState) {
          emailController.clear();
          passwordController.clear();
          return showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text("Error"),
              content: Text(state.message),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Close"))
              ],
            ),
          );
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            child: ListView(
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(
                      MediaQuery.of(context).size.height / 4),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Email",
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                  ),
                  textInputAction: TextInputAction.next,
                  onEditingComplete: () => node.nextFocus(),
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Password",
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                  controller: passwordController,
                  textInputAction: TextInputAction.done,
                  onEditingComplete: () {
                    FocusScope.of(context).unfocus();
                    context.read<SignInBloc>().add(
                          SignInLoginEvent(
                            emailController.text,
                            passwordController.text,
                          ),
                        );
                  },
                ),
                SizedBox(
                  height: getProportionateScreenHeight(50),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      context.read<SignInBloc>().add(
                            SignInLoginEvent(
                                emailController.text, passwordController.text),
                          );
                    },
                    icon: const Icon(Icons.login),
                    label: const Text("Login"),
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(13), elevation: 0),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
