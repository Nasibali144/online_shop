import 'package:flutter/material.dart';
import 'package:online_shop/pages/home_page.dart';

import '../../widgets/cart_cuonter_widget.dart';

class FavoriteProductsPage extends StatefulWidget {

  static final String id = "favorite_products_page";

  @override
  _FavoriteProductsPageState createState() => _FavoriteProductsPageState();
}

class _FavoriteProductsPageState extends State<FavoriteProductsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text(
          'Sevimli mahsulotlarim',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pushReplacementNamed(context, HomePage.id);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 10, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Remax mahsulotlari',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),

              //  product cart
              Container(
                height: 160,
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  children: [

                    // #image
                    Expanded(
                      flex: 1,
                      child: Image(
                        image: AssetImage('assets/images/product/product_4.jpg'),
                        height: 150,
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          // #product name
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: Text("HeadPhone AirDots, Remax company 2500MHz, ISO 2001:1966",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17
                              ),
                            ),
                          ),
                          SizedBox(height: 7.5,),
                          // #price
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('90 000 ', style: TextStyle(color: Colors.green, fontSize: 16),),
                              Text("so'm", style: TextStyle(color: Colors.grey),),
                              SizedBox(width: 15,),
                              Container(
                                height: 40,
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  borderRadius: BorderRadius.only(topRight: Radius.circular(15), topLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
                                ),
                                child: Row(
                                  children: [
                                    Text('90 000 ', style: TextStyle(color: Colors.black,fontSize: 16),),
                                    Text("so'm ga ", style: TextStyle(color: Colors.grey),),
                                    Text("1", style: TextStyle(color: Colors.black,fontSize: 16),),
                                    Text('dona', style: TextStyle(color: Colors.grey),)
                                  ],
                                ),
                              )
                            ],
                          ),

                          // #quantity #like
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.only(left: 10, top: 10),
                            alignment: Alignment.centerLeft,
                            child: CartCounter.cartCounterForListVertical(),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 160,
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  children: [

                    // #image
                    Expanded(
                      flex: 1,
                      child: Image(
                        image: AssetImage('assets/images/product/product_4.jpg'),
                        height: 150,
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          // #product name
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: Text("HeadPhone AirDots, Remax company 2500MHz, ISO 2001:1966",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17
                              ),
                            ),
                          ),
                          SizedBox(height: 7.5,),
                          // #price
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('90 000 ', style: TextStyle(color: Colors.green, fontSize: 16),),
                              Text("so'm", style: TextStyle(color: Colors.grey),),
                              SizedBox(width: 15,),
                              Container(
                                height: 40,
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  borderRadius: BorderRadius.only(topRight: Radius.circular(15), topLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
                                ),
                                child: Row(
                                  children: [
                                    Text('90 000 ', style: TextStyle(color: Colors.black,fontSize: 16),),
                                    Text("so'm ga ", style: TextStyle(color: Colors.grey),),
                                    Text("1", style: TextStyle(color: Colors.black,fontSize: 16),),
                                    Text('dona', style: TextStyle(color: Colors.grey),)
                                  ],
                                ),
                              )
                            ],
                          ),

                          // #quantity #like
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.only(left: 10, top: 10),
                            alignment: Alignment.centerLeft,
                            child: CartCounter.cartCounterForListVertical(),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
