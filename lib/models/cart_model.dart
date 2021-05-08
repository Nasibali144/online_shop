import 'package:flutter/foundation.dart';
import 'package:online_shop/services/pref_service.dart';

class Cart with ChangeNotifier {
  int id;
  //User user;

  Cart({this.id, /*this.user*/});

  Cart.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    //user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    // if (this.user != null) {
    //   data['user'] = this.user.toJson();
    // }
    return data;
  }

  // qo'sha olishing kerak
  int _id;
  getCartId() {
    Pref.loadCartId().then((id) {
      if(id != null) {
        _id = id;
      } else {
        _id = 0;
      }
    });
    notifyListeners();
  }

  int get cartId {
    return _id;
  }
}

class CartList{
  List<Cart> carts;

  CartList.fromJson(List<dynamic> json)
      : carts = List<Cart>.from(json.map((x) => Cart.fromJson(x)));

  List<dynamic> toJson() => [
    List<Cart>.from(carts.map((x) => x.toJson()))
  ];
}

