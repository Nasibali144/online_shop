import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ShowMessage {
  static fireToast(String msg) {
    Fluttertoast.showToast(
      msg:  msg,
      toastLength: Toast.LENGTH_SHORT,
      timeInSecForIosWeb: 1,
      textColor: Colors.white,
      backgroundColor: Colors.grey,
      fontSize: 16,
      gravity: ToastGravity.BOTTOM,
    );
  }
}