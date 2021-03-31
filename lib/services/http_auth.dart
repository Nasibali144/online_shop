import 'dart:convert';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:http/http.dart';
import 'package:online_shop/models/account/user_model.dart';
import 'package:online_shop/services/pref_service.dart';

class HttpAuth{
  static String BASE = 'mybazaar.herokuapp.com';
  static Map<String, String> headers = {'Content-Type': 'application/json'};
  // static Map<String, String> headersWithToken = {
  //   'Authorization': 'Token ${getToken()}'
  // };
  //

  /* Http Apis */

  static String API_REGISTRATION_CREATE = '/api/v1/account/registration/'; // FOR POST
  static String API_USER_UPDATE = '/api/v1/account/user/'; // FOR PUT

  /* Http Requests */

  static Future<String> GET(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api, params);
    var response = await get(uri, headers: headers);
    if(response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  // @k
  static Future<String> POST(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api);
    var response = await post(uri, headers: headers, body: jsonEncode(params));
    if(response.statusCode == 201 || response.statusCode == 200) {
      return response.body;
    } else if(response.statusCode == 400 ) {
      return response.body;
    }
    return null;
  }

  // @k
  static Future<String> PUT(String api, Map<String, String> params, String token) async {
    var uri = Uri.https(BASE, api);
    var response = await put(uri, headers: {'Authorization':'Token $token', 'Content-Type':'application/json'}, body: jsonEncode(params));
    if(response.statusCode == 200) {
      return response.body;
    } else if(response.statusCode == 400) {
      return response.body;
    }
    return null;
  }

  static Future<String> DEL(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api, params);
    var response = await delete(uri, headers: headers);
    if(response.statusCode == 200) {
      return response.body;
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
  static List<String> errorMessage(String body) {
    List<String> errors = new List();
    dynamic json = jsonDecode(body);
    for (var key in json.keys) {
      if(json[key] is List) {
        json[key].map((text) {
          errors.add(text);
        });
      } else {
        errors.add(json[key].toString());
      }
    }
    return errors;
  }
}