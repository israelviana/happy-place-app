import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happy_place/Home/home_page.dart';

const String homePageRoute = 'home-page';

class RouterHappyPlace {
  mainRoutes(){
    return (RouteSettings settings){
     switch (settings.name){
       case homePageRoute:
         return MaterialPageRoute(builder: (_) => const HomePage());
     }
    };
  }
}