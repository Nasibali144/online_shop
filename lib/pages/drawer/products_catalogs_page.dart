import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class ProductsCatalogue extends StatefulWidget {

  static final String id = "products_catalogs_page";

  @override
  _ProductsCatalogueState createState() => _ProductsCatalogueState();
}

class _ProductsCatalogueState extends State<ProductsCatalogue> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Mahsulotlar katalogi',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 1,
        leading: Icon(
          AntDesign.arrowleft,
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: ListTile(
                  leading: Icon(MaterialCommunityIcons.cow),
                  title: Text('Gosht va gosht maxsulotlari'),
                ),
              ),
              Divider(
                height: 2,
              ),
              Container(
                child: ListTile(
                  leading: Icon(Icons.clean_hands),
                  title: Text('Yuvish tozalash'),
                ),
              ),
              Divider(
                height: 2,
              ),
              Container(
                child: ListTile(
                  leading: Icon(FlutterIcons.bottle_wine_mco),
                  title: Text('Bakaleya'),
                ),
              ),
              Divider(
                height: 2,
              ),
              Container(
                child: ListTile(
                  leading: Icon(MaterialCommunityIcons.tea),
                  title: Text('Choy Kofe'),
                ),
              ),
              Divider(
                height: 2,
              ),
              Container(
                child: ListTile(
                  leading: Icon(MaterialCommunityIcons.bread_slice_outline),
                  title: Text('Non va non mahsulotlari'),
                ),
              ),
              Divider(
                height: 2,
              ),
              Container(
                child: ListTile(
                  leading: Icon(Icons.cake),
                  title: Text('Tort va shirinliklar'),
                ),
              ),
              Divider(
                height: 2,
              ),
              Container(
                child: ListTile(
                  leading: Icon(Icons.food_bank),
                  title: Text('Tayyor ovqatlar'),
                ),
              ),
              Divider(
                height: 2,
              ),
              Container(
                child: ListTile(
                  leading: Icon(FlutterIcons.fish_faw5s),
                  title: Text('Konservalar'),
                ),
              ),
              Divider(
                height: 2,
              ),
              Container(
                child: ListTile(
                  leading: Icon(MaterialIcons.build),
                  title: Text('Qurulish mahsulotlari'),
                ),
              ),
              Divider(
                height: 2,
              ),
              Container(
                child: ListTile(
                  leading: Icon(Icons.clean_hands),
                  title: Text('Gigiena'),
                ),
              ),
              Divider(
                height: 2,
              ),
              Container(
                child: ListTile(
                  leading: Icon(FontAwesome.child),
                  title: Text('Kichkina bolalarga'),
                ),
              ),
              Divider(
                height: 2,
              ),
              Container(
                child: ListTile(
                  leading: Icon(FontAwesome5Solid.tshirt),
                  title: Text('Tekstil'),
                ),
              ),
            ],
          )),
    );
  }
}