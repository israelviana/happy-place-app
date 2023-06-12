
import 'dart:convert';

import 'package:happy_place/models/user_model.dart';
import 'package:happy_place/utils/decoration_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesRepository{

  Future<void> saveUserData({String? name, String? email, String? password}) async {
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

  Future saveDaySelected({required List<String> listDays}) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList("listDaySelected", listDays);
  }

  Future<List<String>> getSaveDaySelected() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> listDay = prefs.getStringList("listDaySelected") ?? [];
    return listDay;
  }

}