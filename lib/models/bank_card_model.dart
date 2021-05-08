import 'package:flutter/foundation.dart';

class BankCard {
  String cardNumber;
  String validityPeriod; //amal qilish muddati

  BankCard({this.cardNumber, this.validityPeriod});
}

class BankCardList with ChangeNotifier {

  List<BankCard> _items = [];

  List<BankCard> get items {
    return _items;
  }

  void addItem({BankCard bankCard}) {
    _items.add(bankCard);
    notifyListeners();
  }

  void removeItem({BankCard bankCard}) {
    _items.remove(bankCard);
    notifyListeners();
  }
}