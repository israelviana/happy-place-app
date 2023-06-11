import 'package:flutter/material.dart';
import 'package:happy_place/views/Authentication/login_page.dart';
import 'package:happy_place/views/Authentication/register_page.dart';

import 'package:happy_place/views/Profile/profile_page.dart';

const String homePageRoute = '/home-page';
const String profilePageRoute = '/profile-page';
const String registerPageRoute = '/register-page';

class RouterHappyPlace {
  mainRoutes(){
    return (RouteSettings settings){
     switch (settings.name){
       case homePageRoute:
         return MaterialPageRoute(builder: (_) => const LoginPage());
       case profilePageRoute:
         return MaterialPageRoute(builder: (_) => const Profile());
       case registerPageRoute:
         return MaterialPageRoute(builder: (_) => const RegisterPage());
     }
    };
  }
}