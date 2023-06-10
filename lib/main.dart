import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:happy_place/Services/auth_service.dart';
import 'package:happy_place/auth_check.dart';
import 'package:happy_place/repository/google_sign_in_repository.dart';
import 'package:happy_place/router.dart';
import 'package:provider/provider.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => AuthService()),
          ChangeNotifierProvider(create: (context) => GoogleSignInHappyPlace()),
        ],
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AppHappyPlace',
      home: AuthCheck(),
      onGenerateRoute: RouterHappyPlace().mainRoutes(),/// load
    );
  }
}