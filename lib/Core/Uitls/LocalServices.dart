import 'package:shared_preferences/shared_preferences.dart';

class LocalServices {
  static SharedPreferences? sharedPreferences;
  static Init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }
}
