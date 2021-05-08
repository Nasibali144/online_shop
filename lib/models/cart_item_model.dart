import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:online_shop/services/http_cart.dart';

class CartItem {
  int id;
  int quantity;
  double price;
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

  @override
  bool operator == (other) {
    return (other is CartItem) && other.product == product;
  }

  // yuqoridagi solishtirshniki edi
  @override
  int get hashCode => super.hashCode;
}

class CartItemList with ChangeNotifier {
  List<CartItem> cartItems;

  CartItemList();

  CartItemList.fromJson(List<dynamic> json)
      : cartItems = List<CartItem>.from(json.map((x) => CartItem.fromJson(x)));

  List<dynamic> toJson() =>
      [List<CartItem>.from(cartItems.map((x) => x.toJson()))];

  ////### o'zim qo'shganim ###////
  // apidan data olib kelish
  List<CartItem> _items = [];

  void getApiCartList(BuildContext context) {
    HttpCart.GET(HttpCart.API_CART_ITEM_LIST, HttpCart.paramEmpty(),
            HttpCart.headersWithToken(context))
        .then((response) {
      if (response != null) {
        _items = HttpCart.parseCartItemList(response).cartItems;
        print('Cart List olindi');
        notifyListeners();
      }
    });
  }

  // cart item listni olish
  List<CartItem> get items {
    return [..._items];
  }

  // cart item length
  int get itemCount {
    return _items.length;
  }

  // umumiy narx
  double get totalAmount {
    var total = 0.0;
    _items.forEach((cartItem) {
      total += cartItem.price;
    });
    return total;
  }

  //////
  // internetsiz

  void addItem({CartItem cartItem}) {
    if(_items.contains(cartItem)) {
      int index = _items.indexOf(cartItem);
      _items.replaceRange(index, index + 1, [cartItem]);
    } else {
      _items.add(cartItem);
    }
    notifyListeners();
  }

  // remove bo'lmepti shuni yaxshilab ko'r
  void removeItem({CartItem cartItem}) {
    _items.remove(cartItem);
    notifyListeners();
  }

  void clear() {
    _items = [];
    notifyListeners();
  }

  //////

  ////// internet bilan
  // quantity == 1 bo'ladigan hol uchun; ya'ni bir necha marta quantityni bosgandan keyin bo'ladi
  void addItemWithApi({CartItem cartItem, @required BuildContext context}) {
    HttpCart.POST(HttpCart.API_CART_ITEM_CREATE, HttpCart.paramCreate(cartItem),
        HttpCart.headersWithToken(context))
        .then((response) {
      if (response != null) {
        _items.add(HttpCart.parseCartItem(response));
        print("Cartga qo'shildi");
      }
    });
    notifyListeners();
  }

  // quantity > 1 uchun
  // id ham kelishi kerak
  void updateItemWithApi({CartItem cartItem, @required BuildContext context}) {
    HttpCart.PATCH(HttpCart.API_CART_ITEM_PARTIAL_UPDATE + "${cartItem.id}/", HttpCart.paramPartialUpdate(cartItem), HttpCart.headersWithToken(context)).then((response) {
      if(response != null) {
        CartItem _cartItem = HttpCart.parseCartItem(response);
        // yaxshilab etibor ber to'g'ri solishtireptimi?
        int index = _items.indexOf(_cartItem);
        _items.replaceRange(index, index + 1, [_cartItem]);
        print("Cart Update Bo'ldi");
      } else {
        print('Error => cart item model 105 qator cartitem == null boldi');
      }
    });
    notifyListeners();
  }

  // quantity == 0
  void deleteItemWithApi({CartItem cartItem, @required BuildContext context}) {
    HttpCart.DEL(HttpCart.API_CART_ITEM_DELETE + "${cartItem.id}/", HttpCart.paramEmpty(), HttpCart.headersWithToken(context)).then((value) => print(value));
  }

  // clear
  void clearWithApi(BuildContext context) {
    _items.map((_cartItem) {
      HttpCart.DEL(HttpCart.API_CART_ITEM_DELETE + "${_cartItem.id}/", HttpCart.paramEmpty(), HttpCart.headersWithToken(context)).then((value) => print(value));
    });
    _items = [];
    notifyListeners();
  }

  //o'zimdan qo'shdim agar ishlamasa o'chiriladi
  CartItem findByProductId(int id) {
    return _items.firstWhere((prod) => prod.product == id, orElse: () => null);
  }
}
