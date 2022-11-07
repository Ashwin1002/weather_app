import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static getSharedPreferenceData(
      {required String key, var dValue, required String type}) async {
    late dynamic temp;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    switch (type) {
      case "String":
        temp = prefs.getString(key) ?? dValue;
        break;
      case "int":
        temp = prefs.getInt(key) ?? dValue;
        break;
      case "bool":
        temp = prefs.getBool(key) ?? dValue;
        break;
    }
    return temp;
  }

  static setSharedPreferenceData(
      {required String key,
        required dynamic dValue,
        required String type}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    switch (type) {
      case "String":
        prefs.setString(key, dValue);
        break;
      case "int":
        prefs.setInt(key, dValue);
        break;
      case "bool":
        prefs.setBool(key, dValue);
        break;
    }
  }

  static removeSharedPreferenceData(
      {required String key, required String type}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    switch (type) {
      case "String":
        prefs.remove(key);
        break;
      case "int":
        prefs.remove(key);
        break;
      case "bool":
        prefs.remove(key);
        break;
    }
  }

  static removeAllSharedPreferenceData(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.clear();
  }
}
