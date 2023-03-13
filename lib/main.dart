import 'package:flutter/material.dart';
import 'package:happy_place/router.dart';



void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AppHappyPlace',
      onGenerateRoute: RouterHappyPlace().mainRoutes(),
      initialRoute: homePageRoute, //load
    );
  }
}