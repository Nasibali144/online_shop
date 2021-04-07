import 'package:flutter/material.dart';
import 'package:online_shop/models/product_model.dart';
import 'package:online_shop/pages/product/cart_page.dart';
import 'package:online_shop/services/http_service.dart';
import 'package:online_shop/widgets/product_cart%20_widget.dart';
import 'package:online_shop/widgets/product_category_widget.dart';
import 'package:online_shop/widgets/slider_widget.dart';

class DetailPage extends StatefulWidget {

  static final String id = 'detail_page';

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  List<String> productImage = [
    'assets/images/product/product_2.jpg',
    'assets/images/product/product_3.webp',
  ];

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
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined, color: Colors.black,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Mahsulot nomi', style: TextStyle(color: Colors.black),),
        actions: [
          IconButton(icon: Icon(Icons.shopping_cart, color: Colors.green,), onPressed: () {})
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
                          images: productImage,
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
                              IconButton(icon: Icon(Icons.favorite_border, size: 30, color: Colors.green,), onPressed: () {}),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  SizedBox(height: 7.5,),
                  Text('Maxsulot nomi', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                  SizedBox(height: 7.5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('23 950', style: TextStyle(fontSize: 20, color: Colors.green),),
                      Text(" so'mga ", style: TextStyle(color: Colors.grey),),
                      Text("1", style: TextStyle(fontSize: 18),),
                      Text(" dona", style: TextStyle(color: Colors.grey),),
                    ],
                  ),
                  SizedBox(height: 7.5,),
                  Container(
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
                        // ## counter bo'ladi ##
                        //Navigator.pushReplacementNamed(context, CartPage.id);
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text("MAHSULOT TA'RIFI", style: TextStyle(fontSize: 16),),
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
              child: Text("Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum."),
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
