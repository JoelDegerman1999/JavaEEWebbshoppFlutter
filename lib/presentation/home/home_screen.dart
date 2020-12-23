import 'package:e_commerce/application/auth/auth_bloc.dart';
import 'package:e_commerce/injection.dart';
import 'package:e_commerce/presentation/home/components/home_body.dart';
import 'package:e_commerce/presentation/sign-in/sign_in_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const pageRoute = "home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "E Commerce",
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  const UserAccountsDrawerHeader(
                    currentAccountPicture: CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: Icon(Icons.person, color: Colors.white),
                    ),
                    accountName: Text("Joel Degerman"),
                    accountEmail: Text("joel.degerman1999@gmail.com"),
                  ),
                  const ListTile(
                    title: Text("Order"),
                  ),
                ],
              ),
            ),
            Align(
              alignment: FractionalOffset.bottomCenter,
              child: ListTile(
                onTap: () {
                  getIt<AuthBloc>().add(AuthLogoutEvent());
                  Navigator.pushReplacementNamed(
                      context, SignInScreen.pageRoute);
                },
                title: const Text("Logout"),
                trailing: const Icon(Icons.logout),
              ),
            )
          ],
        ),
      ),
      body: HomeBody(),
    );
  }
}
