import 'dart:convert';
import 'package:online_shop/models/account/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Pref{
  // for key
  static storeToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }

  static Future<String> loadToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get("token");
  }

  static Future<bool> removeToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove("token");
  }

  // for user
  static storeUser(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String stringUser  = jsonEncode(user);
    prefs.setString('user', stringUser);
  }

  static Future<User> loadUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String stringUser = prefs.getString("user");
    if(stringUser == null || stringUser.isEmpty) return null;

    Map map = jsonDecode(stringUser);
    return User.fromJson(map);
  }

  static Future<bool> removeUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove("user");
  }
}