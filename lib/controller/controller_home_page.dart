import 'package:flutter/material.dart';

import '../views/Song/song_page.dart';

class ControllerHomePage{
  Widget currentPage({required int currentIndexPage}){
    switch(currentIndexPage){
      case 0:
        return _meditationPags();
      case 1:
        return _dailyWorkPags();
      case 2:
        return _homePage();
      case 3:
        return _dailyHumorPags();
      case 4:
        return _songPage();
      default:
        return _pageDefault();
    }
  }

  Widget _pageDefault(){
    return const Center(
      child: Text("Page not found"),
    );
  }

  Widget _homePage(){
    return const Center(
      child: Text("home page"),
    );
  }

  Widget _songPage(){
    return const SongPage();
  }

  Widget _meditationPags(){
    return const Center(
      child: Text("meditation pase"),
    );
  }

  Widget _dailyHumorPags(){
    return const Center(
      child: Text("meditation pase"),
    );
  }

  Widget _dailyWorkPags(){
    return const Center(
      child: Text("work dayle"),
    );
  }

}