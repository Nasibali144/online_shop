import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:online_shop/pages/payment_delivery/choose_payment_page.dart';

import 'delivery_type_page.dart';


class TableDeliveryPage extends StatelessWidget {
  static final String id = "table_delivery_page";

  final format1 = DateFormat("yyyy-MM-dd");
  final format2 = DateFormat("HH:mm");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pushReplacementNamed(context, DeliveryType.id);
          },
        ),
        title: Text(
          'Yetkazib berish vaqtini tanlang',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        child: Column(children: <Widget>[

          // #kun
          Text('Yetkazib berish sanasini kiriting:', style: TextStyle(fontSize: 20, color: Colors.black),),
          DateTimeField(
            decoration: InputDecoration(
              labelText: "Yil, oy, kun",
              labelStyle: TextStyle(fontSize: 17, color: Colors.green),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
              ),
            ),
            format: format1,
            onShowPicker: (context, currentValue) {
              return showDatePicker(
                  context: context,
                  firstDate: DateTime.now(),
                  initialDate: currentValue ?? DateTime.now(),
                  lastDate: DateTime(2100));
            },
          ),

          // #soat_minut
          SizedBox(height: 30,),
          Text('Yetkazib berish vaqtini kiriting:', style: TextStyle(fontSize: 20, color: Colors.black),),
          DateTimeField(
            format: format2,
            decoration: InputDecoration(
              labelText: "Soat : minut",
              labelStyle: TextStyle(fontSize: 17, color: Colors.green),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
              ),
            ),
            onShowPicker: (context, currentValue) async {
              final time = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
              );
              return DateTimeField.convert(time);
            },
          ),
          SizedBox(height: 50,),

          // #button
          Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(5)
            ),
            child: FlatButton(
              textColor: Colors.white,
              child: Text('DAVOM ETTIRISH', style: TextStyle(fontSize: 18),),
              onPressed: () {
                Navigator.pushNamed(context, ChosePayment.id);
              },
            ),
          ),
        ]),
      ),
    );
  }
}
