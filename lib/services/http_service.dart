import 'dart:convert';
import 'package:http/http.dart';
import 'package:online_shop/models/banner_model.dart';
import 'package:online_shop/models/product_model.dart';

class Network{
  static String BASE = 'mybazaar.herokuapp.com';
  static Map<String, String> headers = {'Content-Type': 'application/json', 'Vary': 'Accept'};

  /* Http Apis */

  static String API_BANNER = '/api/v1/banner/'; // {ID} GET
  static String API_PRODUCT = '/api/v1/product/'; //{ID} GET


  /* Http Requests */

  static Future<String> GET(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api, params);
    var response = await get(uri, headers: headers);
    if(response.statusCode == 200) {
      print("Response: ${response.body.toString()}");
      return response.body;
    }
    return null;
  }

  static Future<String> POST(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api);
    var response = await post(uri, headers: headers, body: jsonEncode(params));
    if(response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }

  static Future<String> PUT(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api);
    var response = await put(uri, headers: headers, body: jsonEncode(params));
    if(response.statusCode == 200) {
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

  // static Map<String, String> paramCreate(User user) {
  //   Map<String, String> params = new Map();
  //   params.addAll({
  //     'name' : user.name,
  //     'age' : user.age,
  //     'salary' : user.salary
  //   });
  //   return params;
  // }
  //
  // static Map<String, String> paramUpdate(User user) {
  //   Map<String, String> params = new Map();
  //   params.addAll({
  //     'name' : user.name,
  //     'age' : user.age,
  //     'salary' : user.salary
  //   });
  //   return params;
  // }

  /* Http Parsing */

  // FOR Product list
  static ProductList parseProList(String body) {
    dynamic json = jsonDecode(utf8.decode(body.codeUnits));
    return ProductList.fromJson(json);
  }

  // FOR One Product
  static Product parseOneProduct(String body) {
    dynamic json = jsonDecode(utf8.decode(body.codeUnits));
    return Product.fromJson(json);
  }

  // FOR Banner
  static BannerList parseBanners(String body) {
    dynamic json = jsonDecode(body);
    return BannerList.fromJson(json);
  }

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