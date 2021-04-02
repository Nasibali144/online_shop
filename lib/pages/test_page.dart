import 'package:flutter/material.dart';
import 'package:online_shop/models/product_model.dart';
import 'package:online_shop/services/http_service.dart';

class TestPage extends StatefulWidget {
  static final String id = "test_page";

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  List<Product> _products = new List();

  @override
  void initState() {
    super.initState();
    _getApiProductList();
  }

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
      body: ListView.builder(
        itemCount: _products.length,
        itemBuilder: (context, index) {
          return _itemOfProduct(_products[index]);
        },
      ),
    );
  }

  Widget _itemOfProduct(Product product) {
    return Container(
      height: 240,
      width: double.infinity,
      child: Column(
        children: [
          Image(
            image: NetworkImage(product.image),
            height: 200,
          ),
          Text(product.name),
        ],
      ),
    );
  }
}
