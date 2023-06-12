import 'package:flutter/material.dart';
import 'package:happy_place/views/MoodCalendar/mood_calendar_page.dart';
import 'package:happy_place/views/Profile/profile_page.dart';

import '../views/DailyWork/daily_work_page.dart';
import '../views/Home/initial_page.dart';
import '../views/Song/song_page.dart';

class ControllerHomePage{
  Widget currentPage({required int currentIndexPage}){
    switch(currentIndexPage){
      case 0:
        return _homePage();
      case 1:
        return _dailyHumorPags();
      case 2:
        return _songPage();
      case 3:
        return _dailyWorkPags();
      default:
        return _pageDefault();
    }
  }

  String currentTitlePage({required int currentIndexPage}){
    switch(currentIndexPage){
      case 0:
        return "Início";
      case 1:
        return "Rastreador de Humor";
      case 2:
        return "Palavra do dia";
      case 3:
        return "Músicas";
      default:
        return "Página não existe";
    }
  }

  Widget _pageDefault(){
    return const Center(
      child: Text("Page not found"),
    );
  }

  Widget _homePage(){
    return const InitialPage();
  }

  Widget _songPage(){
    return const SongPage();
  }

  Widget _dailyHumorPags(){
    return const MoodCalendar();
  }

  Widget _dailyWorkPags(){
    return const DailyWork();
  }


}