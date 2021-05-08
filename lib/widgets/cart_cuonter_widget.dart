import 'dart:async';

import 'package:flutter/material.dart';
import 'package:online_shop/models/cart_item_model.dart';
import 'package:provider/provider.dart';

class CartCounter {
  //// home page
  static Widget cartCounterForHome(BuildContext context) {
    final cartItemList = Provider.of<CartItemList>(context, listen: false);
    int quantity = 0;
    bool isPressed = false;
    void feelPressFunc() {
      isPressed = true;
      if(isPressed) {
        Timer(
            Duration(seconds: 3),
                () {
              isPressed = false;
            }
        );
      }
    }

    return Align(
      alignment: Alignment.topRight,
      child: Stack(
        children: [
          // icon button
          InkWell(
            onTap: () {
              feelPressFunc();
              quantity++;
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: Icon(
                Icons.add_circle_outline_rounded,
                color: Colors.green,
                size: 32,
              ),
            ),
          ),

          isPressed ? Container(
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
                  feelPressFunc();
                  if(quantity == 1) {
                    quantity--;
                    isPressed = false;
                  } else if(quantity > 1) {
                    quantity--;
                  } else {
                    quantity = 0;
                  }
                }),
                Text(quantity.toString()),
                IconButton(icon: Icon(Icons.add, color: Colors.green,), onPressed: () {
                  feelPressFunc();
                  quantity++;
                }),
              ],
            ),
          ) : SizedBox.shrink(),
        ],
      ),
    );
  }

  //// favoriteproduct and viewed product


  static Widget cartCounterForListVertical() {
    int quantity = 1;
    return Row(
      children: <Widget>[
        buildOutlineButton(
          color: Colors.green,
          icon: Icons.remove,
          press: () {
            if (quantity > 1) {
              quantity--;
            }
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20 / 2,
          ),
          child: Text(
            // if our item is less  then 10 then  it shows 01 02 like that
            quantity.toString().padLeft(2, "0"),
            style: TextStyle(color: Colors.black, fontSize: 17),
          ),
        ),
        buildOutlineButton(
            color: Colors.green,
            icon: Icons.add,
            press: () {
              quantity++;
            }),
        SizedBox(
          width: 10,
        ),
        buildOutlineButton(
            icon: Icons.star_border, color: Colors.grey, press: () {}),
      ],
    );
  }

  static SizedBox buildOutlineButton(
      {IconData icon, Function press, MaterialColor color}) {
    return SizedBox(
      width: 35,
      height: 35,
      child: OutlineButton(
        borderSide: BorderSide(
          width: 2,
          color: color,
        ),
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        onPressed: press,
        child: Icon(
          icon,
          color: Colors.green,
          size: 20,
        ),
      ),
    );
  }
}

/*Align(
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
          )*/
