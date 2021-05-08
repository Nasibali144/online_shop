import 'package:flutter/material.dart';
import 'package:online_shop/pages/payment_delivery/approve_order_page.dart';

import 'bank_card_list_page.dart';

class CardTypes extends StatefulWidget {

  static final String id = "card_type";

  @override
  _CardTypesState createState() => _CardTypesState();
}

class _CardTypesState extends State<CardTypes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Karta turini tanlang',
          style: TextStyle(color: Colors.black),
        ),
        leading: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            ListTile(
              tileColor: Colors.white,
              onTap: () {
                Navigator.pushNamed(context, BankCardListPage.id);
              },
              leading: Icon(
                Icons.credit_card_outlined,
                color: Colors.blue,
              ),
              title: Text('Uzcard'),
              trailing: Icon(Icons.keyboard_arrow_right),
            ),
            Divider(
              height: 2,
            ),
            SizedBox(height: 20),
            ListTile(
              tileColor: Colors.white,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ApproveOrder(msg: "Bank Kartasi", choiceCard: 'MasterCard',)));
              },
              leading: Icon(Icons.wallet_giftcard, color: Colors.green),
              title: Text('MasterCard'),
            ),
            ListTile(
              tileColor: Colors.white,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ApproveOrder(msg: "Bank Kartasi", choiceCard: 'Visa',)));
              },
              leading: Icon(Icons.payments_outlined, color: Colors.red),
              title: Text('Visa'),
            ),
          ],
        ),
      ),
    );
  }
}