import 'package:flutter/foundation.dart';
import 'package:online_shop/models/account/user_model.dart';
import 'package:online_shop/services/pref_service.dart';

class UserData with ChangeNotifier {
  ////
  bool isLoading = false;

  void loadingProgress() {
    isLoading = !isLoading;
    notifyListeners();
  }
  ////

  User _user;
  String _token;

  set user(User user) {
    this._user = user;
    print('USER DATA WORK: SET USER: username: ${_user.username}, phone${_user.phone_number}');
    notifyListeners();
  }

  User get user {
    print('USER DATA WORK: GET USER: username: ${_user.username}, phone${_user.phone_number}');
    return _user;
  }

  set token(String token) {
    this._token = token;
    print('USER DATA WORK: SET TOKEN: $_token');
    notifyListeners();
  }

  String get token {
    print('USER DATA WORK: GET TOKEN: $_token');
    return _token;
  }

  int get uid {
    return _user.id;
  }

  void storeToken(String newToken) {
    this._token = newToken;
    Pref.storeToken(newToken);
    print('USER DATA WORK: STORE TOKEN: $_token');
    notifyListeners();
  }

  void loadToken() {
    Pref.loadToken().then((myToken) {
      print('USER DATA WORK: LOAD TOKEN Prefdagi: $myToken, UserDatadagi: $_token');
      if(_token != myToken) {
        _token = myToken;
      }
      notifyListeners();
    });
  }

  void removeToken() {
    Pref.removeToken().then((value) => print('Remove old token: $value'));
    _token = null;
    print('USER DATA WORK: REMOVE TOKEN: $_token');
    notifyListeners();
  }

  void storeUser(User newUser) {
    this._user = newUser;
    Pref.storeUser(newUser);
    print('USER DATA WORK: STORE USER: username: ${_user.username}, phone${_user.phone_number}');
    notifyListeners();
  }

  void loadUser() {
    Pref.loadUser().then((myUser) {
      print('USER DATA WORK: STORE USER=> USERDATA DAGI: username: ${_user.username}, phone${_user.phone_number}, PREF DAGI: username: ${myUser.username}, phone${myUser.phone_number}');
      if(user.id != myUser.id) {
        _user = myUser;
      }
      notifyListeners();
    });
  }

  void removeUser() {
    Pref.removeUser().then((value) => print('Remove old user: $value'));
    _user = null;
    print('USER DATA WORK: REMOVE USER: $_user');
    notifyListeners();
  }
}