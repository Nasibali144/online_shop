import 'package:flutter/material.dart';
import 'package:online_shop/models/cart_item_model.dart';
import 'package:online_shop/models/product_model.dart';
import 'package:online_shop/pages/product/cart_page.dart';
import 'package:online_shop/widgets/badge_widget.dart';
import 'package:online_shop/widgets/slider_widget.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatefulWidget {

  static final String id = 'detail_page';
  final Product product;
  DetailPage({this.product});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  // List<String> productImage = [
  //   'assets/images/product/product_2.jpg',
  //   'assets/images/product/product_3.webp',
  // ];

  // @override
  // void initState() {
  //   super.initState();
  //   _getApiProduct();
  // }

  //////// product
  // Product product;
  //
  // _getApiProduct() {
  //   Network.GET(Network.API_PRODUCT + '${widget.productId.toString()}/', Network.paramEmpty())
  //       .then((response) => {_checkResponseProduct(response)});
  // }
  //
  // _checkResponseProduct(String response) {
  //   if (response != null) {
  //     setState(() {
  //       product = Network.parseOneProduct(response);
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {

    int quantity = 0;

    final loadedProduct = widget.product;
    final cartItemList = Provider.of<CartItemList>(context, listen: false);
    bool getCartItem = false;
    if(cartItemList.findByProductId(loadedProduct.id)!= null) {
      setState(() {
        quantity = cartItemList.findByProductId(loadedProduct.id).quantity;
        getCartItem = ! getCartItem;
      });
    }


    void updateItemCart(int quantity) {
      if(quantity > 0) {
        cartItemList.addItem(cartItem:  CartItem(quantity: quantity, price: quantity * double.parse(loadedProduct.price), cart: 2, product: loadedProduct.id));
      } else {
        cartItemList.removeItem(cartItem:  CartItem(quantity: quantity, price: quantity * double.parse(loadedProduct.price), cart: 2, product:  loadedProduct.id));
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined, color: Colors.black,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(loadedProduct.name, style: TextStyle(color: Colors.black),),
        actions: [
          //Navigator.pushNamed(context, CartPage.id);
          Consumer<CartItemList>(
            builder: (context, cart, ch) => Badge(
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.25),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ]
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(15),
                    padding: EdgeInsets.symmetric(vertical: 5),
                    width: double.infinity,
                    height: 275,
                    color: Colors.white,
                    child: Stack(
                      children: [
                        SliderWidget(
                          images: [loadedProduct.image],
                          size: (MediaQuery.of(context).size.width - 30) / 265,
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                height: 20,
                                width: 40,
                                decoration: BoxDecoration(
                                    color: Colors.red
                                ),
                                child: Text("-12 %", style: TextStyle(color: Colors.white),),
                              ),
                              IconButton(
                                icon: Icon(
                                  loadedProduct.isFavorite ? Icons.favorite : Icons.favorite_border,
                                ),
                                color: Theme.of(context).accentColor,
                                onPressed: () {
                                  loadedProduct.toggleFavoriteStatus();
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  SizedBox(height: 7.5,),
                  Text( loadedProduct.name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                  SizedBox(height: 7.5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(loadedProduct.price, style: TextStyle(fontSize: 20, color: Colors.green),),
                      Text(" so'mga ", style: TextStyle(color: Colors.grey),),
                      Text("1", style: TextStyle(fontSize: 18),),
                      Text(" donasi", style: TextStyle(color: Colors.grey),),
                    ],
                  ),
                  SizedBox(height: 7.5,),
                  // o'zgaradigan joy
                  !getCartItem ? Container(
                    height: 45,
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.green
                    ),
                    child: FlatButton(
                      child: Text("Savatga qo'shish"),
                      textColor: Colors.white,
                      onPressed: () {
                        setState(() {
                          quantity++;
                          getCartItem = !getCartItem;
                        });
                        cartItemList.addItem(cartItem:  CartItem(quantity: quantity, price: quantity * double.parse(widget.product.price), cart: 2, product: widget.product.id));

                      },
                    ),
                  ): Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                          height: 45,
                          width: 60,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(5)
                          ),
                          child: IconButton(
                            icon: Icon(Icons.remove, color: Colors.white,),
                            onPressed: () {
                              if(quantity >= 1) {
                                setState(() {
                                  quantity--;
                                });
                                updateItemCart(quantity);
                              } else {
                                setState(() {
                                  quantity = 0;
                                  getCartItem = !getCartItem;
                                });
                                updateItemCart(quantity);
                              }
                            },
                          ),
                        ),
                        Container(
                          width: 30,
                          height: 45,
                          child: Center(child: Text(quantity.toString(), style: TextStyle(color: Colors.black, fontSize: 20),)),
                        ),
                        Container(
                          height: 45,
                          width: 60,
                          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(5)
                          ),
                          child: IconButton(
                            icon: Icon(Icons.add, color: Colors.white,),
                            onPressed: () {
                              setState(() {
                                quantity++;
                              });
                              updateItemCart(quantity);
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text("MAHSULOT TA'RIFI", style: TextStyle(fontSize: 16),),
              //https://medium.com/flutter-community/parsing-html-in-dart-with-html-package-cd43c29cc460
            ),
            SizedBox(height: 10,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.25),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ]
              ),
              child: //Text(loadedProduct.description),
              Text(loadedProduct.description),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              padding: EdgeInsets.only(top: 5),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.25),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ]
              ),
                //child: ProductCategoryWidget(productCarts: productCarts, categoryTheme: "O'xshash mahsulotlar",)
              ),
          ],
        ),
      ),
    );
  }
}
