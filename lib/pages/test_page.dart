import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:online_shop/models/banner_model.dart';
import 'package:online_shop/models/category_model.dart';
import 'package:online_shop/models/product_model.dart';
import 'package:online_shop/pages/product/cart_page.dart';
import 'package:online_shop/pages/product/detail_page.dart';
import 'package:online_shop/pages/product/product_list_page.dart';
import 'package:online_shop/services/http_service.dart';
import 'package:online_shop/widgets/drawer_two_widget.dart';

class TestPage extends StatefulWidget {
  static final String id = "test_page";

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {

  @override
  void initState() {
    super.initState();
  }

  String dropDownValue;
  List<String> genderList = [
    'Erkak',
    'Ayol',
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: DropdownButtonFormField(
        elevation: 2,
        decoration: InputDecoration(
          border: InputBorder.none,
            filled: true,
            hintStyle: TextStyle(color: Colors.grey[800]),
            hintText: "Jinsingiz",
            fillColor: Colors.white),
        value: dropDownValue,
        onChanged: (String Value) {
          setState(() {
            dropDownValue = Value;
          });
        },
        items: genderList
            .map((cityTitle) => DropdownMenuItem(
            value: cityTitle, child: Text("$cityTitle")))
            .toList(),
      ),
    );
  }
}
