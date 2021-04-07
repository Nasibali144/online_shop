class CartItem {
  int id;
  int quantity;
  int price;
  String createdAt;
  int cart;
  int product;

  CartItem(
      {this.id,
        this.quantity,
        this.price,
        this.createdAt,
        this.cart,
        this.product});

  CartItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    price = json['price'];
    createdAt = json['created_at'];
    cart = json['cart'];
    product = json['product'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['created_at'] = this.createdAt;
    data['cart'] = this.cart;
    data['product'] = this.product;
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