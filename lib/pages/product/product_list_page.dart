import 'dart:async';
import 'package:flutter/material.dart';
import 'package:online_shop/models/product_model.dart';
import 'package:online_shop/pages/home_page.dart';
import 'package:online_shop/services/http_service.dart';
import 'cart_page.dart';
import 'detail_page.dart';

class ProductListPage extends StatefulWidget {

  static final String id = "product_list_page";

  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getApiProductList();
  }


  //////// product
  List<Product> _products = new List();
  _getApiProductList() {
    Network.GET(Network.API_PRODUCT, Network.paramEmpty())
        .then((response) => {_checkResponseProduct(response)});
  }
  _checkResponseProduct(String response) {
    if (response != null) {
      setState(() {
        _products = Network.parseProList(response).products;
      });
    }
  }


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
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        //padding: const EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 25),
        itemCount: _products.length,
        itemBuilder: (context, index) {
          return _productCart(_products[index]);
        },
      ),
      /*GridView.count(
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
      ),*/
    );
  }

  bool counter = false;
  Widget _productCart(Product product) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, DetailPage.id);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery.of(context).size.width / 2 - 52,
                  width: MediaQuery.of(context).size.width / 2,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(product.image),
                      //fit: BoxFit.cover
                    ),
                  ),
                  alignment: Alignment.topLeft,
                  child: Container(
                    margin: EdgeInsets.only(left: 5, top: 5),
                    alignment: Alignment.center,
                    height: 20,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Colors.red
                    ),
                    child: Text("-12 %", style: TextStyle(color: Colors.white),),
                  ),
                ),
                SizedBox(height: 5,),
                Text("${product.name.length <= 36 ? product.name : product.name.substring(0, 36)}", style: TextStyle(fontWeight: FontWeight.w400),),
                SizedBox(height: 5,),
                Expanded(child: Text("Price: ${product.price} so'm", style: TextStyle(color: Colors.green, fontSize: 16),)),
              ],
            ),
          ),

          Align(
            alignment: Alignment.topRight,
            child: counter ? Container(
              margin: EdgeInsets.all(5),
              height: 40,
              width: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        offset: new Offset(0.0, 0.0),
                        blurRadius: 5.0,
                        spreadRadius: 3.0
                    )
                  ]
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(icon: Icon(Icons.remove, color: Colors.green,), onPressed: () {
                    Timer(
                        Duration(seconds: 3),
                            () {
                          setState(() {
                            counter = !counter;
                          });
                        });
                  }),
                  Text('1'),
                  IconButton(icon: Icon(Icons.add, color: Colors.green,), onPressed: () {
                    Timer(
                        Duration(seconds: 3),
                            () {
                          setState(() {
                            counter = !counter;
                          });
                        });
                  }),
                ],
              ),
            ) : IconButton(icon: Icon(Icons.add_circle_outline_rounded, color: Colors.green, size: 32,), onPressed: () {
              setState(() {
                counter = !counter;
              });
            }, padding: EdgeInsets.all(0),),
          )
        ],
      ),
    );
  }
}
