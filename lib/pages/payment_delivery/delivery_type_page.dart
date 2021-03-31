import 'package:flutter/material.dart';
import 'package:online_shop/pages/payment_delivery/fast_delivery_page.dart';

import 'table_delivery_page.dart';

class DeliveryType extends StatefulWidget {

  static final String id = "delivery_type";

  @override
  _DeliveryTypeState createState() => _DeliveryTypeState();
}

class _DeliveryTypeState extends State<DeliveryType> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        leading: Icon(Icons.arrow_back, color: Colors.black),
        title: Text('Yetkazib berish usulini tanlang',
            style: TextStyle(color: Colors.black)),
      ),
      body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, TableDeliveryPage.id);
                },
                child: Container(
                    color: Colors.white,
                    width: double.infinity,
                    child: ListTile(
                      leading: Icon(Icons.access_time),
                      title: Text('Jadval asosida yetkazib berish'),
                      subtitle: Text('Pulingizni tejang'),
                      trailing: Icon(Icons.keyboard_arrow_right),
                    )),
              ),
              Divider(
                height: 2,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, FastDeliveryPage.id);
                },
                child: Container(
                  child: ListTile(
                    leading: Icon(Icons.airplanemode_active),
                    title: Text('Tezkor  yetkazib berish'),
                    subtitle: Text('Vaxtingizni tejang'),
                    trailing: Icon(Icons.keyboard_arrow_right),
                  ),
                  color: Colors.white,
                  width: double.infinity,

                  // padding: EdgeInsets.all(10),
                  // child: Card(),
                ),
              ),
            ],
          )),
    );
  }
}