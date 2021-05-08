import 'package:flutter/material.dart';
import 'package:online_shop/models/cart_item_model.dart';
import 'package:online_shop/models/product_model.dart';
import 'package:online_shop/pages/payment_delivery/delivery_type_page.dart';
import 'package:online_shop/utils/msg_util.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {

  static final String id = 'cart_page';

  
  
  @override
  Widget build(BuildContext context) {

    final cartItemList = Provider.of<CartItemList>(context);

    _pressButton() {
      if(cartItemList.items.length != 0) {
        Navigator.pushNamed(context, DeliveryType.id);
      } else {
        MsgUtil.fireToast("Mahsulot olish uchun mahsulotlarni belgilang!");
      }
      
    }

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
            child: ListView.builder(
              itemCount: cartItemList.items.length,
              itemBuilder: (context, index) => CartItemWidget(cartItem: cartItemList.items[index],),
            ),
          ),
          // shu joyini yaxshilab tekshirish kerak
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            decoration: BoxDecoration(
              color: Colors.green.shade600,
              borderRadius: BorderRadius.circular(5)
            ),
            child: FlatButton(
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
                          "${cartItemList.totalAmount.toStringAsFixed(0)} so'm",
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
                        )),
                  )
                ],
              ),
              color: Colors.green.shade600,
              onPressed: _pressButton,
            ),
          ),
        ],
      ),
    );
  }
}

/*Expanded(
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
          )*/

class CartItemWidget extends StatefulWidget {

  CartItem cartItem;
  CartItemWidget({this.cartItem});

  @override
  _CartItemWidgetState createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {

  @override
  Widget build(BuildContext context) {
    final cartItemList = Provider.of<CartItemList>(context, listen: false);
    Product product = Provider.of<ProductList>(context, listen: false).findById(widget.cartItem.product);
    int quantity = widget.cartItem.quantity;

    void updateItemCart(int quantity) {
      if(quantity > 0) {
        cartItemList.addItem(cartItem:  CartItem(quantity: quantity, price: quantity * double.parse(product.price), cart: 2, product: product.id));
      } else {
        cartItemList.removeItem(cartItem:  CartItem(quantity: quantity, price: quantity * double.parse(product.price), cart: 2, product:  product.id));
      }
    }

    return Container(
      height: 120,
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
                  image: NetworkImage(product.image),
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
                Text(product.name, style: TextStyle(color: Colors.black, fontSize: 17),),
                SizedBox(height: 4,),
                Text("${product.price} so'mga ${widget.cartItem.quantity} dona", style: TextStyle(color: Colors.grey, fontSize: 15),),
                Row(
                  children: [
                    Text('${widget.cartItem.price} ', style: TextStyle(color: Colors.green, fontSize: 20, fontWeight: FontWeight.w500),),
                    Text("so'm", style: TextStyle(color: Colors.grey),),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove, color: Colors.green, size: 27.5,),
                            padding: EdgeInsets.all(0),
                            onPressed: () {
                              if(quantity == 0) {
                                setState(() {
                                  quantity--;
                                });
                                updateItemCart(quantity);
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
                            },
                          ),
                          Text(quantity.toString(), style: TextStyle(fontSize: 18, color: Colors.black),),
                          IconButton(
                            icon: Icon(Icons.add, color: Colors.green, size: 27.5,),
                            padding: EdgeInsets.all(0),
                            onPressed: () {
                              setState(() {
                                quantity++;
                              });
                              updateItemCart(quantity);
                            },
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
    );
  }
}