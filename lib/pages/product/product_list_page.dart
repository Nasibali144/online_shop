import 'dart:async';
import 'package:flutter/material.dart';
import 'package:online_shop/models/cart_item_model.dart';
import 'package:online_shop/models/product_model.dart';
import 'package:online_shop/pages/home_page.dart';
import 'package:online_shop/services/http_service.dart';
import 'package:online_shop/widgets/badge_widget.dart';
import 'package:provider/provider.dart';
import 'cart_page.dart';
import 'detail_page.dart';

class ProductListPage extends StatefulWidget {

  static final String id = "product_list_page";
  final List<Product> productList;
  final String name;

  ProductListPage({this.productList, this.name});

  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {


  // @override
  // void initState() {
  //   super.initState();
  //   _getApiProductList();
  // }
  //
  // //////// product
  // List<Product> _products = new List();
  // _getApiProductList() {
  //   Network.GET(Network.API_PRODUCT, Network.paramEmpty())
  //       .then((response) => {_checkResponseProduct(response)});
  // }
  // _checkResponseProduct(String response) {
  //   if (response != null) {
  //     setState(() {
  //       _products = Network.parseProList(response).products;
  //     });
  //   }
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined, color: Colors.black, size: 30,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(widget.name, style: TextStyle(color: Colors.black,),),
        backgroundColor: Colors.white,
        actions: [
          Consumer<CartItemList>(
            builder: (context, cart, ch) =>   Badge(
              child: ch,
              value: cart.itemCount.toString(),
            ),
            child: IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.green,
              ),
              onPressed: () {
                Navigator.pushNamed(context, CartPage.id);
              },
            ),
          ),
        ],
      ),
      body: GridView.builder(
        padding: EdgeInsets.only(top: 10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        //padding: const EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 25),
        itemCount: widget.productList.length,
        itemBuilder: (context, index) {
          return ProductItemWidget(widget.productList[index]);
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
}

class ProductItemWidget extends StatefulWidget {
  final Product product;

  ProductItemWidget(this.product);

  @override
  _ProductItemWidgetState createState() => _ProductItemWidgetState();
}

class _ProductItemWidgetState extends State<ProductItemWidget> {

  int quantity = 0;
  bool isPressed = false;


  @override
  Widget build(BuildContext context) {
    final cartItemList = Provider.of<CartItemList>(context, listen: false);

    void updateItemCart(int quantity) {
      if(quantity > 0) {
        cartItemList.addItem(cartItem:  CartItem(quantity: quantity, price: quantity * double.parse(widget.product.price), cart: 2, product: widget.product.id));
      } else {
        cartItemList.removeItem(cartItem:  CartItem(quantity: quantity, price: quantity * double.parse(widget.product.price), cart: 2, product: widget.product.id));
      }
    }

    void feelPressFunc() {
      setState(() {
        isPressed = true;
      });
      if(isPressed) {
        Timer(
            Duration(seconds: 5),
                () {
              setState(() {
                isPressed = false;
              });
            }
        );
      }
    }

    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => DetailPage(product: widget.product,))
              );            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery.of(context).size.width / 2 - 52,
                  width: MediaQuery.of(context).size.width / 2,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(widget.product.image),
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
                Text("${widget.product.name.length <= 36 ? widget.product.name : widget.product.name.substring(0, 36)}", style: TextStyle(fontWeight: FontWeight.w400),),
                SizedBox(height: 5,),
                Expanded(child: Text("Price: ${widget.product.price} so'm", style: TextStyle(color: Colors.green, fontSize: 16),)),
              ],
            ),
          ),

          Align(
            alignment: Alignment.topRight,
            child: Stack(
              children: [
                IconButton(onPressed: (){
                  setState(() {
                    quantity++;
                  });
                  cartItemList.addItem(cartItem:  CartItem(quantity: quantity, price: quantity * double.parse(widget.product.price), cart: 2, product: widget.product.id));
                  feelPressFunc();
                }, icon: Icon(
                  Icons.add_circle_outline_rounded,
                  color: Colors.green,
                  size: 32,
                ),),

                isPressed ? Container(
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
                        feelPressFunc();
                        if(quantity == 0) {
                          setState(() {
                            quantity--;
                          });
                          updateItemCart(quantity);
                          setState(() {
                            isPressed = false;
                          });
                        } else if(quantity >= 1) {
                          setState(() {
                            quantity--;
                          });
                          updateItemCart(quantity);
                        } else {
                          setState(() {
                            quantity = 0;
                          });
                          updateItemCart(quantity);
                        }
                      }),
                      Text(quantity.toString()),
                      IconButton(icon: Icon(Icons.add, color: Colors.green,), onPressed: () {
                        feelPressFunc();
                        setState(() {
                          quantity++;
                        });
                        updateItemCart(quantity);
                      }),
                    ],
                  ),
                ) : SizedBox.shrink(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

