import 'package:flutter/material.dart';

class ApproveOrder extends StatefulWidget {

  static final String id = "approve_order_page";

  @override
  _ApproveOrderState createState() => _ApproveOrderState();
}

class _ApproveOrderState extends State<ApproveOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Buyurtmani tasdiqlash',
          style: TextStyle(color: Colors.black),
        ),
        leading: Icon(
          Icons.arrow_back,
          color: Colors.black,
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
                  SizedBox(height: 20),
                  Container(
                    child: ListTile(
                      leading: Icon(
                        Icons.timelapse,
                      ),
                      title: Text('Yetqazib berish vaxti'),
                      subtitle: Text('Bugun soat 18:00 dan 19:00 gacha'),
                      trailing: Icon(Icons.keyboard_arrow_right),
                    ),
                    color: Colors.white,
                    width: double.infinity,
                  ),
                  SizedBox(height: 20),
                  Container(
                    child: ListTile(
                      leading: Icon(
                        Icons.shopping_cart,
                      ),
                      title: Text('1 dona mahsulot'),
                    ),
                    color: Colors.white,
                    width: double.infinity,
                  ),
                  Container(
                    child: ListTile(
                      leading: Image.asset('assets/images/splash/datasite_logo.png'),
                    ),
                    color: Colors.white,
                    width: double.infinity,
                  ),
                  SizedBox(height: 20),
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
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText:
                          'misol uchun , yetib kelganingizda qongiroq qiling...'),
                    ),
                    color: Colors.white,
                    height: 100,
                    width: double.infinity,
                  ),
                  SizedBox(
                    height: 20,
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
                        trailing: Text('UZCARD'),
                      )),
                  Divider(
                    thickness: 1,
                    height: 1,
                  ),
                  Container(
                      color: Colors.white,
                      width: double.infinity,
                      child: ListTile(
                        leading: Text('Mahsulotlarning narxi'),
                        trailing: Text('2990 som'),
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
                          '2 990 som',
                          style: TextStyle(color: Colors.green),
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: RaisedButton(
                        child: Text(
                          'Buyurtma berish',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        color: Colors.green,
                        onPressed: () {}),
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