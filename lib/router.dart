import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happy_place/views/Login/login_page.dart';
import 'package:happy_place/views/Profile/profile.dart';

const String homePageRoute = '/home-page';
const String profilePageRoute = '/profile-page';

class RouterHappyPlace {
  mainRoutes(){
    return (RouteSettings settings){
     switch (settings.name){
       case homePageRoute:
         return MaterialPageRoute(builder: (_) => const LoginPage());
       case profilePageRoute:
         return MaterialPageRoute(builder: (_) => const Profile());
     }
    };
  }
}