import 'package:flutter/foundation.dart';
import 'cart_item_model.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItem({
    @required this.id,
    @required this.amount,
    @required this.products,
    @required this.dateTime,
  });
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  //https://betterprogramming.pub/top-7-dart-tips-and-tricks-for-cleaner-flutter-apps-562664a15826
  DateTime _dateTime;

  DateTime get dateTime {
    return _dateTime;
  }

  set dateTime(DateTime value) {
    this._dateTime = value;
    notifyListeners();
  }

  void addOrder(List<CartItem> cartProducts, double total) {
    _orders.insert(
      0,
      OrderItem(
        id: DateTime.now().toString(),
        amount: total,
        dateTime: DateTime.now(),
        products: cartProducts,
      ),
    );
    notifyListeners();
  }
}