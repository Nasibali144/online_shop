import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogUtils {
  static dialogShow(
      {String title,
      String content,
      Function function1,
      Function function2,
      @required BuildContext context}) {
    if (Platform.isAndroid) {
      showDialog(
        context: context,
        builder: (context) => new AlertDialog(
          title: new Text(
            title,
            style: TextStyle(color: Colors.black),
          ),
          content: new Text(content),
          actions: <Widget>[
            FlatButton(
              child: Text("O'ZGARTIRISH"),
              onPressed: function2,
            ),
            FlatButton(
              child: Text('HA'),
              onPressed: function1,
            ),
          ],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => new CupertinoAlertDialog(
          title: new Text(
            title,
            style: TextStyle(color: Colors.black),
          ),
          content: new Text(content),
          actions: <Widget>[
            FlatButton(
              child: Text("O'ZGARTIRISH"),
              onPressed: function2,
            ),
            FlatButton(
              child: Text('HA'),
              onPressed: function1,
            ),
          ],
        ),
      );
    }
  }
}
