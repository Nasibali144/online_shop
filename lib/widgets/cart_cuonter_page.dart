import 'package:flutter/material.dart';

class CartCounter extends StatefulWidget {
  @override
  _CartCounterState createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  int numOfItems = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        buildOutlineButton(
          color: Colors.green,
          icon: Icons.remove,
          press: () {
            if (numOfItems > 1) {
              setState(() {
                numOfItems--;
              });
            }
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20 / 2,
          ),
          child: Text(
            // if our item is less  then 10 then  it shows 01 02 like that
            numOfItems.toString().padLeft(2, "0"),
            style: TextStyle(color: Colors.black, fontSize: 17),
          ),
        ),
        buildOutlineButton(
          color: Colors.green,
            icon: Icons.add,
            press: () {
              setState(() {
                numOfItems++;
              });
            }),
        SizedBox(
          width: 10,
        ),
        buildOutlineButton(
            icon: Icons.star_border,
            color: Colors.grey,
            press: () {
              setState(() {});
            }),
      ],
    );
  }

  SizedBox buildOutlineButton(
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