import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:online_shop/models/account/user_data.dart';
import 'package:online_shop/models/account/user_model.dart';
import 'package:provider/provider.dart';

class HttpAuth{
  static String BASE = 'mybazaar.herokuapp.com';
  static Map<String, String> headers = {'Content-Type': 'application/json'};
  static Map<String, String> headersWithToken(BuildContext context) {
    return {'Authorization':'Token ${Provider.of<UserData>(context, listen: false).token}', 'Content-Type':'application/json'};
  }

  /* Http Apis */

  static String API_REGISTRATION_CREATE = '/api/v1/account/registration/'; // FOR POST
  static String API_USER_UPDATE = '/api/v1/account/user/'; // FOR PUT
  static String API_LOGIN_CREATE = '/api/v1/account/login/'; // FOR POST
  static String API_LOGOUT_CREATE = '/api/v1/account/logout/'; // FOR POST

  /* Http Requests */
  // @k
  static Future<Map<String, String>> POST(String api, Map<String, String> params, Map<String, String> header) async {
    var uri = Uri.https(BASE, api);
    var response = await post(uri, headers: header, body: jsonEncode(params));
    if(response.statusCode == 201 || response.statusCode == 200) {
      return {'success' : response.body};
    } else if(response.statusCode == 400 || response.statusCode == 403) {
      return {'error' : response.body};
    }
    return null;
  }

  // @k
  static Future<Map<String, String>> PUT(String api, Map<String, String> params, Map<String, String> header) async {
    var uri = Uri.https(BASE, api);
    var response = await put(uri, headers: header, body: jsonEncode(params));
    if(response.statusCode == 200) {
      return {'success' : response.body};
    } else if(response.statusCode == 400 || response.statusCode == 403) {
      return {'error' : response.body};
    }
    return null;
  }

  /* Http Params */

  static Map<String, String> paramEmpty() {
    Map<String, String> params = new Map();
    return params;
  }

  static Map<String, String> paramCreate(User user) {
    Map<String, String> params = new Map();
    params.addAll({
      'username' : user.username,
      'email' : user.email,
      'password1' : user.password,
      'password2' : user.password,
    });
    return params;
  }

  static Map<String, String> paramCreateForLogin(User user) {
    Map<String, String> params = new Map();
    params.addAll({
      'username' : user.username,
      'email' : user.email,
      'password' : user.password,
    });
    return params;
  }

  static Map<String, String> paramUpdate(User user) {
    Map<String, String> params = new Map();
    params.addAll({
      'username' : user.username,
      'first_name' : user.first_name,
      'last_name' : user.last_name,
      'email' : user.email,
      'phone_number' : user.phone_number,
      'gender' : user.gender,
      'birth_date' : user.birth_date,
    });
    return params;
  }

  /* Http Parsing */

  static Map parseApiKey(String body) {
    dynamic json = jsonDecode(body);
    return json;
  }

  static User parseUser(String body) {
    dynamic json = jsonDecode(body);
    return User.fromJson(json);
  }
//
// static Create parseCreate(String body) {
//   dynamic json = jsonDecode(body);
//   return Create.fromJson(json);
// }
//
// static Update parseUpdate(String body) {
//   dynamic json = jsonDecode(body);
//   return Update.fromJson(json);
// }
//
// static Delete parseDelete(String body) {
//   dynamic json = jsonDecode(body);
//   return Delete.fromJson(json);
// }


  /* Error message */
  static List errorMessage(String body) {
    List errors = new List();
    dynamic json = jsonDecode(utf8.decode(body.codeUnits));
    print("erorMessage function json: ${json.toString()}");
    for (var key in json.keys) {
      if(key == "username") {
        errors.addAll(json[key]);
      } else if(key == "email") {
        errors.addAll(json[key]);
      } else if(key == "password") {
        errors.addAll(json[key]);
      } else if(key == "non_field_errors") {
        errors.addAll(json[key]);
      } else {
        errors.add(json[key]);
      }
    }
    print("Error message function: ${errors.toString()}");
    return errors;
  }
}