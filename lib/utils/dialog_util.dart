import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogUtils {

  BuildContext context;
  static dialogShow({String title, String content, String button, BuildContext context}) {
    if(Platform.isAndroid) {
      showDialog(
        context: context,
        builder: (context) => new AlertDialog(
          title: new Text(title),
          content: new Text(content),
          actions: <Widget>[
            FlatButton(
              child: Text(button),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => new CupertinoAlertDialog(
          title: new Text(title),
          content: new Text(content),
          actions: <Widget>[
            FlatButton(
              child: Text(button),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      );
    }
  }
}