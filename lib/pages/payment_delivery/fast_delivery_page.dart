import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:online_shop/pages/payment_delivery/choose_payment_page.dart';
import 'package:online_shop/pages/payment_delivery/delivery_type_page.dart';
import 'package:online_shop/utils/time_utils.dart';

class FastDeliveryPage extends StatefulWidget {

  static final String id = "fast_delivery_page";

  @override
  _FastDeliveryPageState createState() => _FastDeliveryPageState();
}

class _FastDeliveryPageState extends State<FastDeliveryPage> {

  DateTime dateTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    dateTime = getDateTime();
  }

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
      body: Column(
        children: [
          Expanded(
              child: Center(
                  child: buildTimePicker(),
              ),
          ),
          // #button
          Container(
            margin: EdgeInsets.all(15),
            height: 40,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(5)
            ),
            child: FlatButton(
              textColor: Colors.white,
              child: Text('Davom ettirish', style: TextStyle(fontSize: 18),),
              onPressed: () {
                final value = DateFormat('HH:mm').format(dateTime);
                Utils.showSnackBar(context, 'Selected "$value"');
                Navigator.pushReplacementNamed(context, ChosePayment.id);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTimePicker() => SizedBox(
    height: 180,
    child: CupertinoDatePicker(
      initialDateTime: dateTime,
      mode: CupertinoDatePickerMode.time,
      minuteInterval: 5,
      use24hFormat: true,
      onDateTimeChanged: (dateTime) =>
          setState(() => this.dateTime = dateTime),
    ),
  );

  DateTime getDateTime() {
    final now = DateTime.now();

    return DateTime(now.year, now.month, now.day, now.hour, 0);
  }
}
