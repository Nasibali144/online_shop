import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:online_shop/models/cart_item_model.dart';
import 'package:online_shop/models/order_model.dart';
import 'package:online_shop/models/product_model.dart';
import 'package:online_shop/pages/home_page.dart';
import 'package:online_shop/pages/payment_delivery/orders_history_page.dart';
import 'package:online_shop/utils/msg_util.dart';
import 'package:provider/provider.dart';

class ApproveOrder extends StatefulWidget {
  static final String id = "approve_order_page";

  final String msg;
  final String choiceCard;

  ApproveOrder({this.msg, this.choiceCard});

  @override
  _ApproveOrderState createState() => _ApproveOrderState();
}

class _ApproveOrderState extends State<ApproveOrder> {

  _pressButton(BuildContext context, CartItemList cartItemList) {

    Provider.of<Orders>(context, listen: false).addOrder(
      cartItemList.items,
      cartItemList.totalAmount,
    );
    cartItemList.clear();
    MsgUtil.fireToast("Buyurtmalaringiz qabul qilindi belgilangan vaqtga yetkazib beriladi!");
    Navigator.of(context).pushNamedAndRemoveUntil(OrdersHistoryPage.id, ModalRoute.withName(HomePage.id));
  }

  @override
  Widget build(BuildContext context) {
    final cartItemList = Provider.of<CartItemList>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Buyurtmani tasdiqlash',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 1,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 10),
                  Container(
                    child: ListTile(
                      leading: Icon(
                        Icons.timelapse,
                      ),
                      title: Text('Yetkazib berish vaqti'),
                      subtitle: Text(
                          "${DateFormat("yyyy-MM-dd HH:mm").format(Provider.of<Orders>(context, listen: false).dateTime)}"),
                     // trailing: Icon(Icons.keyboard_arrow_right),
                    ),
                    color: Colors.white,
                    width: double.infinity,
                  ),
                  SizedBox(height: 10),
                  Container(
                    child: ListTile(
                      leading: Icon(
                        Icons.shopping_cart,
                      ),
                      title: Text('${cartItemList.items.length} dona mahsulot'),
                    ),
                    color: Colors.white,
                    width: double.infinity,
                  ),
                  Container(
                    height: 60,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: cartItemList.items.length,
                      itemBuilder: (context, index) {
                        CartItem cartItem = cartItemList.items[index];
                        Product product = Provider.of<ProductList>(context, listen: false).findById(cartItem.product);
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 2.5),
                          height: 55,
                          child: Image.network(product.image),
                        );
                      },
                    ),
                    color: Colors.white,
                    width: double.infinity,
                  ),
                  SizedBox(height: 10),
                  Container(
                    child: ListTile(
                      leading: Icon(
                        Icons.description,
                      ),
                      title: Text('Izoh'),
                    ),
                    color: Colors.white,
                    width: double.infinity,
                  ),
                  Divider(
                    thickness: 1,
                    height: 1,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText:
                              'Misol uchun, yetib kelganingizda qongiroq qiling...'),
                    ),
                    color: Colors.white,
                    height: 100,
                    width: double.infinity,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      color: Colors.white,
                      width: double.infinity,
                      child: ListTile(
                        leading: Icon(
                          Icons.card_travel_sharp,
                        ),
                        title: Text('Buyurtma hisoboti'),
                      )),
                  Divider(
                    height: 1,
                  ),
                  widget.msg.contains("Naqd Pulda")  ? Container(color: Colors.white,
                width: double.infinity,
                child: ListTile(
                  leading: Text('Tolov usuli'),
                  trailing: Text(widget.msg),
                )) : Column(
                    children: [
                      Container(
                          color: Colors.white,
                          width: double.infinity,
                          child: ListTile(
                            leading: Text('Tolov usuli'),
                            trailing: Text('Bank Kartasi'),
                          )),
                      Divider(
                        thickness: 1,
                        height: 1,
                      ),
                      Container(
                          color: Colors.white,
                          width: double.infinity,
                          child: ListTile(
                            leading: Text('Karta turi'),
                            trailing: Text("${widget.choiceCard}"),
                          )),
                    ],
                  ),

                  Divider(
                    thickness: 1,
                    height: 1,
                  ),
                  Container(
                      color: Colors.white,
                      width: double.infinity,
                      child: ListTile(
                        leading: Text('Mahsulotlarning narxi'),
                        trailing: Text("${cartItemList.totalAmount.toStringAsFixed(0)} so'm"),
                      )),
                  Divider(
                    thickness: 1,
                    height: 1,
                  ),
                  Container(
                      color: Colors.white,
                      width: double.infinity,
                      child: ListTile(
                        leading: Text('Yetkazib berish'),
                        trailing: Text('0 som'),
                      )),
                  Divider(
                    thickness: 1,
                    height: 1,
                  ),
                  Container(
                      color: Colors.white,
                      width: double.infinity,
                      child: ListTile(
                        leading: Text(
                          'Tolov uchun jami',
                          style: TextStyle(color: Colors.green),
                        ),
                        trailing: Text(
                          "${cartItemList.totalAmount.toStringAsFixed(0)} so'm",
                          style: TextStyle(color: Colors.green),
                        ),
                      )),
                  Container(
                    margin:  EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: FlatButton(
                      padding: EdgeInsets.all(0),
                        child: Text(
                          'Buyurtma berish',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        onPressed: () {
                          _pressButton(context, cartItemList);
                        },),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
