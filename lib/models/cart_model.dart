
class Cart {
  int id;

  Cart({this.id,});

  Cart.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
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

