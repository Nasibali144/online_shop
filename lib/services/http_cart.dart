import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:online_shop/models/account/user_data.dart';
import 'package:online_shop/models/cart_item_model.dart';
import 'package:online_shop/models/cart_model.dart';
import 'package:provider/provider.dart';

class HttpCart {
  static String BASE = 'mybazaar.herokuapp.com';
  static Map<String, String> headers = {'Content-Type': 'application/json'};

  static Map<String, String> headersWithToken(BuildContext context) {
    return {
      'Authorization':
          'Token ${Provider.of<UserData>(context, listen: false).token}',
      'Content-Type': 'application/json'
    };
  }

  /* Http Apis */

  // for cart
  static String API_CART_CREATE = '/api/v1/cart/'; // FOR POST
  static String API_CART_LIST = '/api/v1/cart/'; // FOR GET
  static String API_CART_READ = '/api/v1/cart/'; // FOR GET {ID}
  static String API_CART_UPDATE = '/api/v1/cart/'; // FOR PUT {ID}
  static String API_CART_DELETE = '/api/v1/cart/'; // FOR DEL {ID}

  // for cart item

  static String API_CART_ITEM_CREATE = '/api/v1/cart_item/'; // FOR POST
  static String API_CART_ITEM_LIST = '/api/v1/cart_item/'; // FOR GET
  static String API_CART_ITEM_READ = '/api/v1/cart_item/'; // FOR GET {ID}
  static String API_CART_ITEM_UPDATE = '/api/v1/cart_item/'; // FOR PUT {ID}
  static String API_CART_ITEM_PARTIAL_UPDATE = '/api/v1/cart_item/'; // FOR PATCH {ID}
  static String API_CART_ITEM_DELETE = '/api/v1/cart_item/'; // FOR DEL {ID}

  /* Http Requests */

  static Future<String> GET(String api, Map<String, String> params,
      Map<String, String> header) async {
    var uri = Uri.https(BASE, api, params);
    var response = await get(uri, headers: header);
    if (response.statusCode == 200) {
      print("Response: ${response.body.toString()}");
      return response.body;
    }
    return null;
  }

  static Future<String> POST(String api, Map<String, String> params,
      Map<String, String> header) async {
    var uri = Uri.https(BASE, api);
    var response = await post(uri, headers: header, body: jsonEncode(params));
    if (response.statusCode == 201 || response.statusCode == 200) {
      print("My status code: OK 200 or 201");
      return response.body;
    }
    return null;
  }

  static Future<String> PUT(String api, Map<String, String> params,
      Map<String, String> header) async {
    var uri = Uri.https(BASE, api);
    var response = await put(uri, headers: header, body: jsonEncode(params));
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String> PATCH(String api, Map<String, String> params,
      Map<String, String> header) async {
    var uri = Uri.https(BASE, api);
    var response = await patch(uri, headers: header, body: jsonEncode(params));
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String> DEL(String api, Map<String, String> params,
      Map<String, String> header) async {
    var uri = Uri.https(BASE, api, params);
    var response = await delete(uri, headers: header);
    if (response.statusCode == 204) {
      return 'success' + response.body;
    }
    return null;
  }

  /* Http Params */

  static Map<String, String> paramEmpty() {
    Map<String, String> params = new Map();
    return params;
  }

  static Map<String, String> paramCreate(CartItem cartItem) {
    Map<String, String> params = new Map();
    params.addAll({
      'quantity' : cartItem.quantity.toString(),
      'price' : cartItem.price.toString(),
      'cart' : cartItem.cart.toString(),
      'product' : cartItem.product.toString(),
    });
    return params;
  }

  static Map<String, String> paramUpdate(CartItem cartItem) {
    Map<String, String> params = new Map();
    params.addAll({
      'quantity' : cartItem.quantity.toString(),
      'price' : cartItem.price.toString(),
      'cart' : cartItem.cart.toString(),
      'product' : cartItem.product.toString(),
    });
    return params;
  }

  static Map<String, String> paramPartialUpdate(CartItem cartItem) {
    Map<String, String> params = new Map();
    params.addAll({
      'quantity' : cartItem.quantity.toString(),
      'price' : cartItem.price.toString(),
      // 'cart' : cartItem.cart.toString(),
      // 'product' : cartItem.product.toString(),
    });
    return params;
  }

  /* Http Parsing */

  // for cart
  static Cart parseCart(String body) {
    dynamic json = jsonDecode(body);
    return Cart.fromJson(json);
  }

  static CartList parseCartList(String body) {
    dynamic json = jsonDecode(body);
    return CartList.fromJson(json);
  }

  //for cart item

  static CartItem parseCartItem(String body) {
    dynamic json = jsonDecode(body);
    return CartItem.fromJson(json);
  }

  static CartItemList parseCartItemList(String body) {
    dynamic json = jsonDecode(body);
    return CartItemList.fromJson(json);
  }

}
