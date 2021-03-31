class CartItem {
  int cart;
  int product;
  int quantity;
  String createdAt;

  CartItem({this.cart, this.product, this.quantity, this.createdAt});

  CartItem.fromJson(Map<String, dynamic> json) {
    cart = json['cart'];
    product = json['product'];
    quantity = json['quantity'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cart'] = this.cart;
    data['product'] = this.product;
    data['quantity'] = this.quantity;
    data['created_at'] = this.createdAt;
    return data;
  }
}

class CartItemList{
  List<CartItem> cartItems;

  CartItemList.fromJson(List<dynamic> json)
      : cartItems = List<CartItem>.from(json.map((x) => CartItem.fromJson(x)));

  List<dynamic> toJson() => [
    List<CartItem>.from(cartItems.map((x) => x.toJson()))
  ];
}