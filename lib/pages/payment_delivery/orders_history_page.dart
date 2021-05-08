import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:online_shop/models/order_model.dart';
import 'package:online_shop/models/product_model.dart';
import 'package:online_shop/pages/home_page.dart';
import 'package:provider/provider.dart';
import 'dart:math';

class OrdersHistoryPage extends StatefulWidget {
  static final String id = "orders_history_page";

  @override
  _OrdersHistoryPageState createState() => _OrdersHistoryPageState();
}

class _OrdersHistoryPageState extends State<OrdersHistoryPage> {
  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Buyurtmalarim ro\'yxati',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pushReplacementNamed(context, HomePage.id);
          },
        ),
        elevation: 1,
      ),
      body: ListView.builder(
        itemCount: orderData.orders.length,
        itemBuilder: (context, i) => _orderItem(orderData.orders[i]),
      ),
    );
  }

  Widget _orderItem(OrderItem orderItem) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            subtitle: Text('${orderItem.amount} so\'m'),
            title: Text(
              "${DateFormat('dd/MM/yyyy HH:mm').format(orderItem.dateTime)} vaqtdagi buyurtma",
            ),
            trailing: IconButton(
              icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
          if (_expanded)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              height: orderItem.products.length * 70.0,
              child: ListView(
                children: orderItem.products
                    .map(
                      (prod) => ListTile(
                        leading: Image.network(Provider.of<ProductList>(context, listen: false).findById(prod.product).image, height: 50,),
                        title: Text(Provider.of<ProductList>(context, listen: false).findById(prod.product).name,),
                        subtitle: Text(
                          '${prod.quantity} dona umumiy: ${prod.price.toStringAsFixed(0)} so\'m',
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
        ],
      ),
    );
  }
}
