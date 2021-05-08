//// ### pagination => qilingan => how to do pagination in flutter => poisk

// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:online_shop/models/product_model.dart';
// import 'package:online_shop/services/http_service.dart';
// import 'package:provider/provider.dart';
//
// class TestPage extends StatefulWidget {
//   static final String id = "test_page";
//
//   @override
//   _TestPageState createState() => _TestPageState();
// }
//
// class _TestPageState extends State<TestPage> {
//
//   // pagination
//   ScrollController controller = ScrollController();
//   void _scrollListener() {
//     if (controller.offset >= controller.position.maxScrollExtent &&
//         !controller.position.outOfRange) {
//       print("at the end of list");
//       Provider.of<ProductList>(context, listen: false).getApiNextProductList();
//     }
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     controller.addListener(_scrollListener);
//     //_getApiProductList();
//   }
//
//   // List<Product> _products = new List();
//   // _getApiProductList() {
//   //   Network.GET(Network.API_PRODUCT, Network.paramEmpty())
//   //       .then((response) => {_checkResponseProduct(response)});
//   // }
//   // _checkResponseProduct(String response) {
//   //   if (response != null) {
//   //     setState(() {
//   //       _products = Network.parseProList(response).products;
//   //     });
//   //   }
//   // }
//
//   // serverdan data olib kelish
//   var _isInit = true;
//   var _isLoading = false;
//   @override
//   void didChangeDependencies() {
//     if (_isInit) {
//       setState(() {
//         _isLoading = true;
//       });
//       Provider.of<ProductList>(context).getApiProductFirstList().then((value)
//       {
//         setState(() {
//           _isLoading = false;
//         });
//       });
//     }
//     setState(() {
//       _isInit = false;
//     });
//     super.didChangeDependencies();
//   }
//
//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Stack(
//         children: [
//           // productni ko'rsatadi
//         Consumer<ProductList>(
//           builder: (context, productList, child) {
//             return ListView.builder(
//                 itemCount: productList.items.length,
//                 shrinkWrap: true,
//                 controller: controller,
//                 itemBuilder: (context, index) {
//                   var product = productList.items[index];
//                   return Container(
//                     height: 240,
//                     width: double.infinity,
//                     margin: EdgeInsets.only(bottom: 5),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       image: DecorationImage(
//                         image: NetworkImage(product.image),
//                       ),
//                     ),
//                   );
//                 }
//             );
//           },
//         ),
//
//           _isLoading ? Center(
//             child: CircularProgressIndicator(),
//           ) : SizedBox.shrink(),
//         ],
//       ),
//     );
//   }
// }

// Pagination siz

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:online_shop/models/product_model.dart';
import 'package:provider/provider.dart';

class TestPage extends StatefulWidget {
  static final String id = "test_page";

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {

  Map<String, List<Product>> categoryMap = new Map();

  // serverdan data olib kelish
  var _isInit = true;
  var _isLoading = false;
  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<ProductList>(context).getApiProductFirstList(context);
      categoryMap = Provider.of<ProductList>(context).categoryMap;
      setState(() {
        _isLoading = false;
      });
    }

    setState(() {
      _isInit = false;
    });
    super.didChangeDependencies();
  }

  // malumot olish





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _isLoading ? Center(
        child: CircularProgressIndicator(),
      ) : Consumer<ProductList>(
        builder: (context, productList, child) {
          return ListView.builder(
              itemCount: productList.items.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var product = productList.items[index];
                return Container(
                  height: 240,
                  width: double.infinity,
                  margin: EdgeInsets.only(bottom: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                      image: NetworkImage(product.image),
                    ),
                  ),
                );
              }
          );
        },
      ),
    );
  }
}
