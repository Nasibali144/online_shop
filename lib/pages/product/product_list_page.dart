import 'package:flutter/material.dart';
import 'package:online_shop/pages/home_page.dart';
import 'package:online_shop/widgets/product_cart%20_widget.dart';

import 'cart_page.dart';

class ProductListPage extends StatefulWidget {

  static final String id = "product_list_page";

  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined, color: Colors.black, size: 30,),
          onPressed: () {
            Navigator.pushReplacementNamed(context, HomePage.id);
          },
        ),
        title: Text("maxslot turi", style: TextStyle(color: Colors.black,),),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.green,
              size: 30,
            ),
            onPressed: () {
              Navigator.pushNamed(context, CartPage.id);
            },
          )
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 2 / 2.75,
        padding: const EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 25),
        mainAxisSpacing: 15.0,
        crossAxisSpacing: 15.0,
        children: [
          ProductCard(),
          ProductCard(),
          ProductCard(),
          ProductCard(),
        ],
      ),
    );
  }
}
