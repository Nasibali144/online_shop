import 'dart:async';

import 'package:flutter/material.dart';
import 'package:online_shop/pages/product/detail_page.dart';

class ProductCard extends StatefulWidget {

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool counter = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      width: 140,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, DetailPage.id);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 155,
                  width: 140,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/product/product_1.png'),
                      )
                  ),
                  alignment: Alignment.topCenter,
                  child: Container(
                    alignment: Alignment.center,
                    height: 20,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Colors.red
                    ),
                    child: Text("-12 %", style: TextStyle(color: Colors.white),),
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Text('Price: 5000 ', style: TextStyle(color: Colors.green, fontSize: 16),),
                    Text("so'm", style: TextStyle(color: Colors.grey, fontSize: 14),)
                  ],
                ),
                SizedBox(height: 10,),
                Text('Description: descr iption descri ption descri ption', style: TextStyle(fontWeight: FontWeight.w400),),
              ],
            ),
          ),

          Align(
            alignment: Alignment.topRight,
            child: counter ? Container(
              margin: EdgeInsets.all(5),
              height: 40,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      offset: new Offset(0.0, 0.0),
                      blurRadius: 5.0,
                      spreadRadius: 3.0
                  )
                ]
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(icon: Icon(Icons.remove, color: Colors.green,), onPressed: () {
                    Timer(
                        Duration(seconds: 3),
                            () {
                          setState(() {
                            counter = !counter;
                          });
                            });
                  }),
                  Text('1'),
                  IconButton(icon: Icon(Icons.add, color: Colors.green,), onPressed: () {
                    Timer(
                        Duration(seconds: 3),
                            () {
                          setState(() {
                            counter = !counter;
                          });
                        });
                  }),
                ],
              ),
            ) : IconButton(icon: Icon(Icons.add_circle_outline_rounded, color: Colors.green, size: 32,), onPressed: () {
              setState(() {
                counter = !counter;
              });
            }, padding: EdgeInsets.all(0),),
          )
        ],
      ),
    );
  }
}
