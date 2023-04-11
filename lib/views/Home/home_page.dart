import 'package:flutter/material.dart';
import 'package:happy_place/Services/auth_service.dart';
import 'package:provider/provider.dart';

import '../../repository/google_sign_in.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Happy place"),
      ),
      body: Center(
        child: ElevatedButton(onPressed: (){
          context.read<AuthService>().logout();
          context.read<GoogleSignInHappyPlace>().logout();
        }, child: Text("logout")),
      ),
    );
  }
}
