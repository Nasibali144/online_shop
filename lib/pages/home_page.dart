import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:online_shop/models/banner_model.dart';
import 'package:online_shop/models/cart_item_model.dart';
import 'package:online_shop/models/product_model.dart';
import 'package:online_shop/pages/product/cart_page.dart';
import 'package:online_shop/pages/product/detail_page.dart';
import 'package:online_shop/pages/product/product_list_page.dart';
import 'package:online_shop/services/http_service.dart';
import 'package:online_shop/services/pref_service.dart';
import 'package:online_shop/widgets/badge_widget.dart';
import 'package:online_shop/widgets/drawer_one_widget.dart';
import 'package:online_shop/widgets/drawer_two_widget.dart';
import 'package:provider/provider.dart';

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
    _getBannerList();
    print(Pref.loadAuthStatus());
    setState(() {
      authStatus = Pref.loadAuthStatus();
    });
  }

  bool isSearch = false;

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

  //// product and category
  // serverdan data olib kelish
  Map<String, List<Product>> categoryMap = new Map();

  var _isInit = true;
  @override
  void didChangeDependencies() async {
    if (_isInit) {
      Provider.of<ProductList>(context, listen: false).loadingProgress();
      await Provider.of<ProductList>(context, listen: false).getApiProductFirstList(context);
      Future.delayed(Duration(seconds: 10), () {
        setState(() {
          categoryMap = Provider.of<ProductList>(context, listen: false).categoryMap;
          print("HHHHHHHHHHH : ${categoryMap.toString()}");
        });
        Provider.of<ProductList>(context, listen: false).loadingProgress();

      });
    }
    setState(() {
      _isInit = false;
    });
    super.didChangeDependencies();
  }

  // // refresh
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
  new GlobalKey<RefreshIndicatorState>();
  Future<void> _refresh() async{
    Provider.of<ProductList>(context, listen: false).loadingProgress();

    await Provider.of<ProductList>(context, listen: false).getApiProductFirstList(context);
    Future.delayed(const Duration(seconds: 7), () {
      setState(() {
        categoryMap = Provider.of<ProductList>(context, listen: false).categoryMap;
        print("HHHHHHHHHHH : ${categoryMap.toString()}");
      });
      Provider.of<ProductList>(context, listen: false).loadingProgress();
    });

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
          //Navigator.pushNamed(context, CartPage.id);
          Consumer<CartItemList>(
            builder: (context, cart, ch) => Badge(
              child: ch,
              value: cart.itemCount.toString(),
            ),
            child: IconButton(
              icon: Icon(
                Icons.shopping_cart,
              ),
              onPressed: () {
                Navigator.pushNamed(context, CartPage.id);
              },
            ),
          ),
        ],
      ),

      // ###drawer###
      // shu yerda xatolik berishi mumkin
      drawer: authStatus == "LOGGED_IN" ? DrawerTwo() : DrawerOne(),
      body: Provider.of<ProductList>(context, listen: false).isLoading ? Center(
        child: CircularProgressIndicator(),
      ) :
      RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: _refresh,
        child: SingleChildScrollView(
          child: Column(
            children: [
              // #reklama
              _bannerWidget(),
              //kategoriyalar
              Column(
                children: categoryMap.entries.map( (mapItem) => _categoryList(mapItem.key, mapItem.value)).toList(),
              )
            ],
          ),
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

  Widget _categoryList(String category, List<Product> product) {
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
                Text(category, style: TextStyle(fontSize: 16),),
                FlatButton(
                  height: 30,
                  color: Colors.green[50],
                  textColor: Colors.green,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ProductListPage(productList: product, name: category,)));
                    //Navigator.pushReplacementNamed(context, ProductListPage.id);
                  },
                  child: Text('Barchasi',),
                )
              ],
            ),
          ),
          Divider(),
          Expanded(
            child: ProductsListViewWidget(products: product,),
            ),
        ],
      ),
    );
  }

  // bool counter = false;
  // Widget _productCart(Product product) {
  //   return Container(
  //     margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
  //     width: 140,
  //     child: Stack(
  //       children: [
  //         GestureDetector(
  //           onTap: () {
  //             Navigator.pushNamed(context, DetailPage.id);
  //           },
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Container(
  //                 height: 155,
  //                 width: 140,
  //                 decoration: BoxDecoration(
  //                   image: DecorationImage(
  //                     image: NetworkImage(product.image),
  //                   ),
  //                 ),
  //                 alignment: Alignment.topLeft,
  //                 child: Container(
  //                   margin: EdgeInsets.only(left: 5, top: 5),
  //                   alignment: Alignment.center,
  //                   height: 20,
  //                   width: 40,
  //                   decoration: BoxDecoration(
  //                       color: Colors.red
  //                   ),
  //                   child: Text("-12 %", style: TextStyle(color: Colors.white),),
  //                 ),
  //               ),
  //               SizedBox(height: 5,),
  //               Text("${product.name.length <= 36 ? product.name : product.name.substring(0, 36)}", style: TextStyle(fontWeight: FontWeight.w400),),
  //               SizedBox(height: 5,),
  //               Expanded(child: Text("Price: ${product.price} so'm", style: TextStyle(color: Colors.green, fontSize: 16),)),
  //             ],
  //           ),
  //         ),
  //
  //         Align(
  //           alignment: Alignment.topRight,
  //           child: counter ? Container(
  //             margin: EdgeInsets.all(5),
  //             height: 40,
  //             width: 120,
  //             decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.circular(5),
  //                 color: Colors.white,
  //                 boxShadow: [
  //                   BoxShadow(
  //                       color: Colors.black.withOpacity(0.25),
  //                       offset: new Offset(0.0, 0.0),
  //                       blurRadius: 5.0,
  //                       spreadRadius: 3.0
  //                   )
  //                 ]
  //             ),
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceAround,
  //               children: [
  //                 IconButton(icon: Icon(Icons.remove, color: Colors.green,), onPressed: () {
  //                   Timer(
  //                       Duration(seconds: 3),
  //                           () {
  //                         setState(() {
  //                           counter = !counter;
  //                         });
  //                       });
  //                 }),
  //                 Text('1'),
  //                 IconButton(icon: Icon(Icons.add, color: Colors.green,), onPressed: () {
  //                   Timer(
  //                       Duration(seconds: 3),
  //                           () {
  //                         setState(() {
  //                           counter = !counter;
  //                         });
  //                       });
  //                 }),
  //               ],
  //             ),
  //           ) : IconButton(icon: Icon(Icons.add_circle_outline_rounded, color: Colors.green, size: 32,), onPressed: () {
  //             setState(() {
  //               counter = !counter;
  //             });
  //           }, padding: EdgeInsets.all(0),),
  //         )
  //       ],
  //     ),
  //   );
  // }
}

class ProductsListViewWidget extends StatelessWidget {
  final List<Product> products;

  ProductsListViewWidget({this.products});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: products.length,
      itemBuilder: (context, index) => ProductItemWidget(
        products[index],
        // products[i].title,
        // products[i].imageUrl,
      ),
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

  @override
  void initState() {
    super.initState();
    _getCartId();
  }

  int cartId;
  int quantity = 0;
  bool isPressed = false;

  _getCartId() {
    Pref.loadCartId().then((id) {
      setState(() {
        cartId = id;
      });
    });
  }

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
      width: 140,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => DetailPage(product: widget.product,))
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 155,
                  width: 140,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(widget.product.image),
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
                // icon button
                InkWell(
                  onTap: () {
                    setState(() {
                      quantity++;
                    });
                    cartItemList.addItem(cartItem:  CartItem(quantity: quantity, price: quantity * double.parse(widget.product.price), cart: 2, product: widget.product.id));
                    // cartni ham o'yla
                    //cartItemList.addItemWithApi(context: context, cartItem: CartItem(quantity: quantity, price: quantity * double.parse(widget.product.price), cart: 2, product: widget.product.id),);
                    feelPressFunc();
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(32),
                    child: Icon(
                      Icons.add_circle_outline_rounded,
                      color: Colors.green,
                      size: 32,
                    ),
                  ),
                ),

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


// like itemdagi
/*
 Consumer<Product>(
            builder: (ctx, product, _) => IconButton(
                  icon: Icon(
                    product.isFavorite ? Icons.favorite : Icons.favorite_border,
                  ),
                  color: Theme.of(context).accentColor,
                  onPressed: () {
                    product.toggleFavoriteStatus();
                  },
                ),
          )
 */

