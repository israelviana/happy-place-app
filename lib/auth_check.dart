import 'package:flutter/material.dart';

import 'package:happy_place/Services/auth_service.dart';
import 'package:happy_place/views/Authentication/login_page.dart';
import 'package:happy_place/views/Home/home_page.dart';

import 'package:provider/provider.dart';

class AuthCheck extends StatefulWidget {
  const AuthCheck({Key? key}) : super(key: key);

  @override
  State<AuthCheck> createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  @override
  Widget build(BuildContext context) {
    AuthService auth = Provider.of<AuthService>(context);

    if(auth.isLoading) return loading();
    else if(auth.usuario == null) return LoginPage();
    else return HomePage();
  }

  Widget loading() {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
