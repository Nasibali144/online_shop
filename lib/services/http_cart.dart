import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:online_shop/models/account/user_data.dart';
import 'package:provider/provider.dart';

class HttpCart{
  static String BASE = 'mybazaar.herokuapp.com';
  static Map<String, String> headers = {'Content-Type': 'application/json'};
  static Map<String, String> headersWithToken(BuildContext context) {
    return {'Authorization':'Token ${Provider.of<UserData>(context, listen: false).token}', 'Content-Type':'application/json'};
  }

  /* Http Apis */

  static String API_CART_CREATE = '/api/v1/cart/'; // FOR POST

  /* Http Requests */

  // @k
  static Future<String> POST(String api, Map<String, String> params, Map<String, String> header) async {
    var uri = Uri.https(BASE, api);
    var response = await post(uri, headers: header, body: jsonEncode(params));
    if(response.statusCode == 201 || response.statusCode == 200) {
      print("My status code: OK 200 or 201");
      return "OK";
    }
    return null;
  }


  /* Http Params */

  static Map<String, String> paramEmpty() {
    Map<String, String> params = new Map();
    return params;
  }


  /* Http Parsing */


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
}