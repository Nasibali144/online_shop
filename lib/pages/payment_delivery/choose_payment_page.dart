import 'package:flutter/material.dart';
import 'package:online_shop/pages/payment_delivery/approve_order_page.dart';
import 'package:online_shop/pages/payment_delivery/card_types_page.dart';

class ChosePayment extends StatefulWidget {

  static final String id = "chose_payment";

  @override
  _ChosePaymentState createState() => _ChosePaymentState();
}

class _ChosePaymentState extends State<ChosePayment> {

  bool isChoiceMoney = false;
  bool isChoiceBankCard = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(icon: Icon(Icons.arrow_back, color: Colors.black), onPressed: () => Navigator.pop(context),),
        title: Text("To'lov  usulini tanlang",
            style: TextStyle(color: Colors.black)),
      ),
      body: Column(children: [
        Expanded(
          child: Column(
            children: [
              ListTile(
                tileColor: Colors.white,
                onTap: () {
                  setState(() {
                    isChoiceBankCard = false;
                    isChoiceMoney = true;
                  });
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ApproveOrder(msg: "Naqd Pulda",)));
                },
                leading: Icon(
                  Icons.payments,
                  color: Colors.yellow,
                ),
                title: Text('Naqd Pulda'),
                trailing: isChoiceMoney ? Icon(
                  Icons.check,
                  color: Colors.green,
                ) : null,
              ),
              Divider(
                height: 2,
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    isChoiceBankCard = true;
                    isChoiceMoney = false;
                  });
                  Navigator.pushNamed(context, CardTypes.id);
                },
                tileColor: Colors.white,
                leading: Icon(Icons.credit_card, color: Colors.blue),
                title: Text('Bank Kartasi'),
                trailing: isChoiceBankCard ? Icon(
                  Icons.check,
                  color: Colors.green,
                ) : null,
              ),
            ],
          ),
        ),
      ],),
    );
  }
}