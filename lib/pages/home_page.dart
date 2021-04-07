import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:online_shop/models/banner_model.dart';
import 'package:online_shop/models/category_model.dart';
import 'package:online_shop/models/product_model.dart';
import 'package:online_shop/pages/product/cart_page.dart';
import 'package:online_shop/pages/product/detail_page.dart';
import 'package:online_shop/pages/product/product_list_page.dart';
import 'package:online_shop/services/http_service.dart';
import 'package:online_shop/services/pref_service.dart';
import 'package:online_shop/widgets/drawer_one_widget.dart';
import 'package:online_shop/widgets/drawer_two_widget.dart';

class HomePage extends StatefulWidget {
  static final String id = 'home_page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String authStatus;

  @override
  void initState() {
    super.initState();
    _getApiProductList();
    _getBannerList();
    _getApiCategoryList();
    print(Pref.loadAuthStatus());
    setState(() {
      authStatus = Pref.loadAuthStatus();
    });
  }

  bool isSearch = false;

  List<Widget> productCarts = new List();

  void _getProductsId() {
    for (int i = 0; i < _products.length; i++) {
      setState(() {
        productCarts.add(_productCart(_products[i]));
      });
    }
  }

  List<String> categoryTexts = new List();

  void _getCategoryName() {
    for (int i = 0; i < _categories.length; i++) {
      setState(() {
        categoryTexts.add((_categories[i].name));
      });
    }
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
    _getProductsId();
  }

  //////// banner
  List<String> imagesReklama = new List();
  BannerList _banners;
  _getBannerList() {
    Network.GET(Network.API_BANNER, Network.paramEmpty())
        .then((response) => {_parsingBanner(response)});
  }
  _parsingBanner(String response) {
    _banners = Network.parseBanners(response);
    for (BannerModel banner in _banners.banners) {
      setState(() {
        imagesReklama.add(banner.image.toString());
      });
    }
  }


  ///////// category
  List<ProCategory> _categories = new List();
  _getApiCategoryList() {
    Network.GET(Network.API_CATEGORY, Network.paramEmpty())
        .then((response) => {_checkResponseCategory(response)});
  }
  _checkResponseCategory(String response) {
    if (response != null) {
      setState(() {
        _categories = Network.parseCategoryList(response).categories;
      });
    }
    _getCategoryName();
  }

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
      ) :
      AppBar(
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
      // shu yerda xatolik berishi mumkin
      drawer: authStatus == "LOGGED_IN" ? DrawerTwo() : DrawerOne(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // #reklama
            _bannerWidget(),

            //kategoriyalar
            Column(
              children: List<Widget>.from(categoryTexts.map(
                    (text) => _categoryList(text),
              )).toList(),
            )
          ],
        ),
      ),
    );
  }



  Widget _bannerWidget() {
    print(MediaQuery.of(context).size.width);
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width * 603 / 1922,
      child: new Swiper(
        autoplay: true,
        autoplayDelay: 3000,
        layout: SwiperLayout.DEFAULT,
        itemCount: imagesReklama.length,
        itemBuilder: (BuildContext context, int index) {
          return Image(image: NetworkImage(imagesReklama[index]));
        },
      ),
    );
  }

  Widget _categoryList(String text) {
    return Container(
      height: 320,
      margin: EdgeInsets.only(bottom: 20),
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(height: 7.5,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            alignment: Alignment.center,
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(text, style: TextStyle(fontSize: 16),),
                FlatButton(
                  height: 30,
                  color: Colors.green[50],
                  textColor: Colors.green,
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, ProductListPage.id);
                  },
                  child: Text('Barchasi',),
                )
              ],
            ),
          ),
          Divider(),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: productCarts.length,
              itemBuilder: (context, index) => productCarts[index],
            ),
          ),
        ],
      ),
    );
  }

  bool counter = false;
  Widget _productCart(Product product) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      width: 140,
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
                  height: 155,
                  width: 140,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(product.image),
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
