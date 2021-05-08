import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:online_shop/services/http_service.dart';
import 'package:online_shop/utils/msg_util.dart';
import 'package:online_shop/utils/time_utils.dart';
import 'package:provider/provider.dart';

import 'category_model.dart';


class Product with ChangeNotifier {
  // add
  bool isFavorite = false;

  int id;
  String name;
  String price;
  String image;
  String description;
  int rating;
  int quantity;
  String slug;
  bool isSale;
  int category;

  Product(
      {this.id,
        this.name,
        this.price,
        this.image,
        this.description,
        this.rating,
        this.quantity,
        this.slug,
        this.isSale,
        this.category});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    image = json['image'];
    description = json['description'];
    rating = json['rating'];
    quantity = json['quantity'];
    slug = json['slug'];
    isSale = json['is_sale'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['image'] = this.image;
    data['description'] = this.description;
    data['rating'] = this.rating;
    data['quantity'] = this.quantity;
    data['slug'] = this.slug;
    data['is_sale'] = this.isSale;
    data['category'] = this.category;
    return data;
  }
  void toggleFavoriteStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}

class ProductList with ChangeNotifier {
  int count;
  String next;
  String previous;
  List<Product> products;

  ProductList({this.count, this.next, this.previous, this.products});

  ProductList.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      products = new List<Product>();
      json['results'].forEach((v) {
        products.add(new Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['next'] = this.next;
    data['previous'] = this.previous;
    if (this.products != null) {
      data['results'] = this.products.map((v) => v.toJson()).toList();
    }
    return data;
  }

////////////////////////////////////////////////////////
  ////### o'zim qo'shganim ###////
  // apidan data olib kelish
  List<Product> _items = new List();
  ProductList _productList;

  Future<String> getApiProductFirstList(BuildContext context) async {
    Network.GET(Network.API_PRODUCT, Network.paramEmpty()).then((response) {
      if (response != null) {
        _productList = Network.parseProList(response);
        _items = _productList.products;
        notifyListeners();
        Provider.of<CategoryList>(context, listen: false).getApiCategoryList();
        /// o'zimdan qo'shdim
        getAllDataInServer(context);
        /// 2 o'zimdan qo'shdim
        notifyListeners();
      }
    });

    return "SUCCESS";
  }

  Future<void> getApiNextProductList(BuildContext context) async {
    String _nextUrl = _productList.next;
    if(_nextUrl != null) {
      var url = Uri.parse(_productList.next);
      var response = await get(url, headers: Network.headers);
      if(response.statusCode == 200) {
        print("Response: ${response.body.toString()}");
        _productList = Network.parseProList(response.body);
        _items.addAll(_productList.products);
      }
      print(response.statusCode.toString());
      notifyListeners();
      await getAllDataInServer(context);
      notifyListeners();
    } else {
      MsgUtil.fireToast("Barcha ma'lumotlarni ko'rib bo'ldingiz!");
      print(_items.toString());
    }
  }

  Map<String, List<Product>> _categoryMap = new Map();
  Map<String, Map<String, List<Product>>> _categoryMapDrawer = new Map();

  //home page category
  Future<void> getAllDataInServer(BuildContext context) async {
    if(_productList.next != null) {
      await getApiNextProductList(context);
    } else {
      print("Work Done List length: ${_items.length}");
      /// 2 o'zimdan qo'shdim
      _categoryMap = myCategoryProduct(context);
      _categoryMapDrawer = myCategoryProductDrawer(context);
      print(_categoryMap);
      notifyListeners();
    }
  }

  Map<String, List<Product>> myCategoryProduct(BuildContext context) {
    Map<String, List<Product>> categories = new Map();
    List<ProCategory> category = Provider.of<CategoryList>(context, listen: false).categories;
    List<Product> products = Provider.of<ProductList>(context, listen:  false).items;
    for(ProCategory itemCategoryList in category) {
      List<Product> proList = new List();
      for(Children childItem in itemCategoryList.children) {
        for(Product product in products) {
          if(childItem.id == product.category) {
            proList.add(product);
          }
        }
      }
      categories.addAll({"${itemCategoryList.name}" : proList});
    }
    notifyListeners();
    return categories;
  }

  Map<String, List<Product>> get categoryMap {
    return _categoryMap;
  }

  // drawer page
  Map<String, Map<String, List<Product>>> myCategoryProductDrawer(BuildContext context) {
    Map<String, Map<String, List<Product>>> categories = new Map();
    List<ProCategory> category = Provider.of<CategoryList>(context, listen: false).categories;
    List<Product> products = Provider.of<ProductList>(context, listen:  false).items;
    for(ProCategory itemCategoryList in category) {
      Map<String, List<Product>> proMap = new Map();
      List<Product> proList = new List();
      for(Children childItem in itemCategoryList.children) {
        for(Product product in products) {
          if(childItem.id == product.category) {
            proList.add(product);
          }
        }
        proMap.addAll({'${childItem.name}' : proList});
      }
      proMap.addAll({'Barchasi' : proList});
      categories.addAll({"${itemCategoryList.name}" : proMap});
    }
    notifyListeners();
    return categories;
  }

  Map<String, Map<String, List<Product>>> get categoryMapDrawer {
    return _categoryMapDrawer;
  }

  ///// loading
  bool isLoading = false;
  void loadingProgress() {
    isLoading = !isLoading;
    //notifyListeners();
  }
 ////////////////////////////////////////////////////////////////
  // product listni olish
  List<Product> get items {
    return [..._items];
  }

  ProductList get productList {
    return _productList;
  }

  // shart emas
  void getList(List<Product> list) {
    _items = [...list];
    notifyListeners();
  }

  // like qo'yilgan productlarni olish
  List<Product> get favoriteItems {
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }

  // id bo'yicha qidirish
  Product findById(int id) {
    return _items.firstWhere((prod) => prod.id == id);
  }
}
