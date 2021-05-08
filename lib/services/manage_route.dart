import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/pages/authentication/create_login_page.dart';
import 'package:online_shop/pages/authentication/create_registration_page.dart';
import 'package:online_shop/pages/home_page.dart';
import 'package:online_shop/pages/intro/intro_page.dart';
import 'package:online_shop/services/pref_service.dart';

enum AuthStatus {
  NOT_DETERMINED,
  NOT_LOGGED_IN,
  LOGGED_IN,
}


class ManageNavigation with ChangeNotifier{
  static String getStatus(AuthStatus authStatus) {
    switch (authStatus) {
      case AuthStatus.NOT_DETERMINED:
        return "NOT_DETERMINED";
        break;
      case AuthStatus.NOT_LOGGED_IN:
        return "NOT_LOGGED_IN";
        break;
      case AuthStatus.LOGGED_IN:
        return "LOGGED_IN";
        break;
      default:
        return "NOT_DETERMINED";
        break;
    }
  }
  
  static void  getRouteId(BuildContext context, String authStatus) {
    switch (authStatus) {
      case "NOT_DETERMINED":
        Navigator.pushReplacementNamed(context, CreateRegistrationPage.id);
        break;
      case "NOT_LOGGED_IN":
        Navigator.pushReplacementNamed(context, CreateLoginPage.id);
        break;
      case "LOGGED_IN":
        Navigator.pushReplacementNamed(context, HomePage.id);
        break;
      default:
        Navigator.pushReplacementNamed(context, IntroPage.id);
        break;
    }
  }

  static manageRoute(BuildContext context) {
    try{
      String status = Pref.loadAuthStatus();
      print("Status Auth: =>.....$status");
      if(status == "NO DATA IN STATUS DATABASE") {
        Navigator.pushReplacementNamed(context, IntroPage.id);
      } else if(status != null) {
        getRouteId(context, status);
      } else {
        Navigator.pushReplacementNamed(context, IntroPage.id);
      }
    } catch (e) {
      print('ERROR MESSAGES: $e');
    }
  }
}

