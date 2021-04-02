import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:online_shop/models/banner_model.dart';
import 'package:online_shop/pages/product/cart_page.dart';
import 'package:online_shop/services/http_service.dart';
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

  // start

  List<String> imagesReklama = new List();
  BannerList _banners;

  _getBannerList() {
    Network.GET(Network.API_BANNER, Network.paramEmpty()).then((response) => {
      _parsingBanner(response)
    });
  }

  _parsingBanner(String response) {
    _banners = Network.parseBanners(response);
    for(BannerModel banner in _banners.banners) {
      setState(() {
        imagesReklama.add(banner.image.toString());
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _getBannerList();
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
            _bannerWidget(),

            //kategoriyalar
            Column(
              children: List<Widget>.from(categoryTexts.map((text) => ProductCategoryWidget(productCarts: productCarts, categoryTheme: text,),)).toList(),
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
}
