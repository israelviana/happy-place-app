
import 'dart:convert';

import 'package:happy_place/models/user_model.dart';
import 'package:happy_place/utils/decoration_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesRepository{

  Future saveUserData({String? name, String? email, String? password}) async {
    UserModel userData = UserModel(
        name: name,
        email: email,
        password: password
    );
    String userDataString = json.encode(userData.toJson());
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("userData", userDataString);
  }

  Future<UserModel> getUserData() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userData = prefs.getString("userData");
    UserModel userDataModel = UserModel.fromJson(jsonDecode(userData!));
    return userDataModel;
  }

  Future saveDaySelected({required List<DateTime> listDays}) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> listStringDay = Utils().convertDateTimeListToStringList(listDays);
    prefs.setStringList("listDaySelected", listStringDay);
  }

  Future<List<DateTime>> getSaveDaySelected() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<DateTime> listDay = [];
    List<String> listDayJson = prefs.getStringList("listDaySelected") ?? [];
    if(listDayJson.isNotEmpty){
      listDay = Utils().convertStringListToDateTimeList(listDayJson);
    }
    return listDay;
  }

}