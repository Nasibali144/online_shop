import 'customer_model.dart';

class Cart {
  int id;
  Customer customer;
  String createdAt;

  Cart({this.id, this.customer, this.createdAt});

  Cart.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.customer != null) {
      data['customer'] = this.customer.toJson();
    }
    data['created_at'] = this.createdAt;
    return data;
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

