import 'dart:convert';
import 'package:online_shop/models/account/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'manage_route.dart';

class Pref{
  /*
  source:
  https://educity.app/flutter/the-right-way-to-use-shared-preferences-in-flutter
  https://fluttercorner.com/how-to-store-and-get-data-from-shared-preferences-in-flutter/

  example
  //umumiy e'lon qilib olish
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final SharedPreferences prefs = await _prefs;

  int counter = 10;

  //store
  prefs.setInt("counter", counter);
  //load
  prefs.getInt('counter');

  //init state ni ichida ishlatib ketish
  _counter = _prefs.then((SharedPreferences prefs) {
      return (prefs.getInt('counter') ?? 0);
    });
  */
  // update new code
  static Pref _pref;
  static SharedPreferences _preferences;
  static Future<Pref> getInstance() async {
    if (_pref == null) {
      var secureStorage = Pref._();
      await secureStorage._init();
      _pref = secureStorage;
    }
    return _pref;
  }

  Pref._();

  Future _init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // get string
  static String loadAuthStatus({String defValue = 'NO DATA IN STATUS DATABASE'}) {
    if (_preferences == null) return defValue;
    return _preferences.getString("status") ?? defValue;
  }

  // put string
  static Future<bool> storeAuthStatus(AuthStatus status) {
    if (_preferences == null) return null;
    return _preferences.setString("status", ManageNavigation.getStatus(status));
  }

  // clear string
  static Future<bool> removeAuthStatus() {
    if (_preferences == null) return null;
    return _preferences.remove("status");
  }
  //////////////////

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

  // for Cart id
  static storeCartId(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('id', id);
  }

  static Future<int> loadCartId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('id');
  }

  static Future<bool> removeCartId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove("id");
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
