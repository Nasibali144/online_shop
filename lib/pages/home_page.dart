import 'package:flutter/material.dart';
import 'package:online_shop/pages/cart_page.dart';
import 'package:online_shop/widgets/drawer_one_widget.dart';
import 'package:online_shop/widgets/drawer_two_widget.dart';
import 'package:online_shop/widgets/product_cart%20_widget.dart';
import 'package:online_shop/widgets/product_category_widget.dart';
import 'package:online_shop/widgets/slider_widget.dart';

class HomePage extends StatefulWidget {
  static final String id = 'home_page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSearch = false;

  List<Widget> productCarts = [
    ProductCard(),
    ProductCard(),
    ProductCard(),
    ProductCard(),
  ];

  List<String> categoryTexts = [
    "Eng yaxshi takliflar",
    "Aksiya",
    "Arzonlashtirilgan mahsulotlar",
    "Eng ko'p sotiladigan mahsulotlar",
  ];

  List<String> imagesReklama = [
    'assets/images/adds/add_1.jpg',
    'assets/images/adds/add_2.webp',
    'assets/images/adds/add_3.webp',
    'assets/images/adds/add_4.webp',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: isSearch ? AppBar(
        backgroundColor: Colors.green,
        leading: null,
        title: Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          width: double.infinity,
          height: 32,
          decoration: BoxDecoration(
              color: Colors.green[700],
              borderRadius: BorderRadius.circular(5),),
          child: TextField(
            style: TextStyle(
              color: Colors.white
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Qidiruv',
                hintStyle: TextStyle(fontSize: 14.5, color: Colors.white)),
          ),
        ),
        actions: [
          FlatButton(onPressed: () {
            setState(() {
              isSearch = !isSearch;
            });
          }, child: Text('Yopish', style: TextStyle(color: Colors.white),),
          padding: EdgeInsets.all(0),)
        ],
      ): AppBar(
        backgroundColor: Colors.green,
        title: Container(
          width: double.infinity,
          height: 32,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.grey)),
          child: TextField(
            onTap: () {
              setState(() {
                isSearch = !isSearch;
              });
            },
            decoration: InputDecoration(
                border: InputBorder.none,
                icon: Icon(Icons.search),
                hintText: 'Mahsulot qidirish',
                hintStyle: TextStyle(fontSize: 14.5)),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {
              Navigator.pushNamed(context, CartPage.id);
            },
          )
        ],
      ),

      // ###drawer###
      drawer: DrawerTwo(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // #reklama
            Container(
              height: 275,
              color: Colors.white,
              child: SliderWidget(
                images: imagesReklama,
                texts: categoryTexts,
                size: MediaQuery.of(context).size.width / 275,
              ),
            ),

            //kategoriyalar
            Column(
              children: List<Widget>.from(categoryTexts.map((text) => ProductCategoryWidget(productCarts: productCarts, categoryTheme: text,),)).toList(),
            )
          ],
        ),
      ),
    );
  }
}
