import 'package:flutter/material.dart';
import 'package:online_shop/pages/drawer/delivery_type_page.dart';
import '../widgets/cart_cuonter_page.dart';

class CartPage extends StatefulWidget {

  static final String id = 'cart_page';

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: Text(
          'Xaridlar savati',
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
      ),
      body: Column(
        children: [
          Expanded(
            flex: 8,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // # card
                  Container(
                    height: 100,
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(vertical: 1,),
                    padding: EdgeInsets.all(5),
                    color: Colors.white,
                    child: Row(
                      children: [
                        Container(
                          width: 90,
                          height: 90,
                          margin: EdgeInsets.only(right: 5),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/product/product_4.jpg'),
                            )
                          ),
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            alignment: Alignment.topLeft,
                            child: Container(
                              alignment: Alignment.center,
                              height: 20,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: Colors.red
                              ),
                              child: Text("-12 %", style: TextStyle(color: Colors.white),),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('HeadPhone Remax mahsuloti', style: TextStyle(color: Colors.black, fontSize: 17),),
                              SizedBox(height: 4,),
                              Text("90 000 so'mga 1 dona", style: TextStyle(color: Colors.grey, fontSize: 15),),
                              Row(
                                children: [
                                  Text('90 000 ', style: TextStyle(color: Colors.green, fontSize: 20, fontWeight: FontWeight.w500),),
                                  Text("so'm", style: TextStyle(color: Colors.grey),),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                          icon: Icon(Icons.remove, color: Colors.green, size: 27.5,),
                                          padding: EdgeInsets.all(0),
                                          onPressed: () {},
                                        ),
                                        Text('1', style: TextStyle(fontSize: 18, color: Colors.black),),
                                        IconButton(
                                          icon: Icon(Icons.add, color: Colors.green, size: 27.5,),
                                          padding: EdgeInsets.all(0),
                                          onPressed: () {},
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 100,
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(vertical: 1,),
                    padding: EdgeInsets.all(5),
                    color: Colors.white,
                    child: Row(
                      children: [
                        Container(
                          width: 90,
                          height: 90,
                          margin: EdgeInsets.only(right: 5),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/product/product_4.jpg'),
                              )
                          ),
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            alignment: Alignment.topLeft,
                            child: Container(
                              alignment: Alignment.center,
                              height: 20,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: Colors.red
                              ),
                              child: Text("-12 %", style: TextStyle(color: Colors.white),),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('HeadPhone Remax mahsuloti', style: TextStyle(color: Colors.black, fontSize: 17),),
                              SizedBox(height: 4,),
                              Text("90 000 so'mga 1 dona", style: TextStyle(color: Colors.grey, fontSize: 15),),
                              Row(
                                children: [
                                  Text('90 000 ', style: TextStyle(color: Colors.green, fontSize: 20, fontWeight: FontWeight.w500),),
                                  Text("so'm", style: TextStyle(color: Colors.grey),),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                          icon: Icon(Icons.remove, color: Colors.green, size: 27.5,),
                                          padding: EdgeInsets.all(0),
                                          onPressed: () {},
                                        ),
                                        Text('1', style: TextStyle(fontSize: 18, color: Colors.black),),
                                        IconButton(
                                          icon: Icon(Icons.add, color: Colors.green, size: 27.5,),
                                          padding: EdgeInsets.all(0),
                                          onPressed: () {},
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 100,
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(vertical: 1,),
                    padding: EdgeInsets.all(5),
                    color: Colors.white,
                    child: Row(
                      children: [
                        Container(
                          width: 90,
                          height: 90,
                          margin: EdgeInsets.only(right: 5),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/product/product_4.jpg'),
                              )
                          ),
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            alignment: Alignment.topLeft,
                            child: Container(
                              alignment: Alignment.center,
                              height: 20,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: Colors.red
                              ),
                              child: Text("-12 %", style: TextStyle(color: Colors.white),),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('HeadPhone Remax mahsuloti', style: TextStyle(color: Colors.black, fontSize: 17),),
                              SizedBox(height: 4,),
                              Text("90 000 so'mga 1 dona", style: TextStyle(color: Colors.grey, fontSize: 15),),
                              Row(
                                children: [
                                  Text('90 000 ', style: TextStyle(color: Colors.green, fontSize: 20, fontWeight: FontWeight.w500),),
                                  Text("so'm", style: TextStyle(color: Colors.grey),),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                          icon: Icon(Icons.remove, color: Colors.green, size: 27.5,),
                                          padding: EdgeInsets.all(0),
                                          onPressed: () {},
                                        ),
                                        Text('1', style: TextStyle(fontSize: 18, color: Colors.black),),
                                        IconButton(
                                          icon: Icon(Icons.add, color: Colors.green, size: 27.5,),
                                          padding: EdgeInsets.all(0),
                                          onPressed: () {},
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  RaisedButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Rasmiylashtirish',
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          decoration: BoxDecoration(
                              color: Colors.green[700],
                              borderRadius: BorderRadius.circular(5)
                          ),
                          child: Center(
                              child: Text(
                                '48 000 som',
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
                              )),
                        )
                      ],
                    ),
                    color: Colors.green.shade600,
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, DeliveryType.id);
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}