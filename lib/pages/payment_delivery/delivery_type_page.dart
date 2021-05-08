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
        leading: IconButton(icon: Icon(Icons.arrow_back, color: Colors.black), onPressed: () => Navigator.pop(context),),
        title: Text('Yetkazib berish usulini tanlang',
            style: TextStyle(color: Colors.black)),
      ),
      body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ListTile(
                tileColor: Colors.white,
                onTap: () {
                  Navigator.pushNamed(context, TableDeliveryPage.id);
                },
                leading: Icon(Icons.access_time),
                title: Text('Jadval asosida yetkazib berish'),
                subtitle: Text('Pulingizni tejang'),
                trailing: Icon(Icons.keyboard_arrow_right),
              ),
              Divider(
                height: 2,
              ),
              ListTile(
                tileColor: Colors.white,
                onTap: () {
                  Navigator.pushNamed(context, FastDeliveryPage.id);
                },
                leading: Icon(Icons.airplanemode_active),
                title: Text('Tezkor  yetkazib berish'),
                subtitle: Text('Vaxtingizni tejang'),
                trailing: Icon(Icons.keyboard_arrow_right),
              ),
            ],
          )),
    );
  }
}