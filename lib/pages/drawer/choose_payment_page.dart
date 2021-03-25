import 'package:flutter/material.dart';
import 'package:online_shop/pages/drawer/approve_order_page.dart';
import 'package:online_shop/pages/drawer/card_types_page.dart';

class ChosePayment extends StatefulWidget {

  static final String id = "chose_payment";

  @override
  _ChosePaymentState createState() => _ChosePaymentState();
}

class _ChosePaymentState extends State<ChosePayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        leading: Icon(Icons.arrow_back, color: Colors.black),
        title: Text('Tolov  usulini tanlang',
            style: TextStyle(color: Colors.black)),
      ),
      body: Column(children: [
        Expanded(
          child: Column(
            children: [
              GestureDetector(
                child: Container(
                    color: Colors.white,
                    width: double.infinity,
                    child: ListTile(
                      leading: Icon(
                        Icons.payments,
                        color: Colors.yellow,
                      ),
                      title: Text('Naqd Pulda'),
                    )),
                onTap: () {
                  Navigator.pushNamed(context, ApproveOrder.id);
                },
              ),
              Divider(
                height: 2,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, CardTypes.id);
                },
                child: Container(
                  child: ListTile(
                    leading: Icon(Icons.credit_card, color: Colors.blue),
                    title: Text('Bank Kartasi'),
                    subtitle: Text('Uzcard : 860012******0052'),
                    trailing: Icon(
                      Icons.check,
                      color: Colors.green,
                    ),
                  ),
                  color: Colors.white,
                  width: double.infinity,
                ),
              ),
            ],
          ),
        ),
        // Container(
        //   margin: EdgeInsets.all(10),
        //   width: MediaQuery.of(context).size.width,
        //   child: RaisedButton(
        //     child: Text(
        //       'Davom etish',
        //       style: TextStyle(fontSize: 15),
        //     ),
        //     color: Colors.green,
        //     onPressed: () {},
        //   ),
        // ),
      ]),
    );
  }
}