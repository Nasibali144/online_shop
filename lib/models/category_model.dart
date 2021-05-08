

import 'package:flutter/foundation.dart';
import 'package:online_shop/services/http_service.dart';

class CategoryList with ChangeNotifier{
  int count;
  String next;
  String previous;
  List<ProCategory> category;

  CategoryList({this.count, this.next, this.previous, this.category});

  CategoryList.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      category = new List<ProCategory>();
      json['results'].forEach((v) {
        category.add(new ProCategory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['next'] = this.next;
    data['previous'] = this.previous;
    if (this.category != null) {
      data['results'] = this.category.map((v) => v.toJson()).toList();
    }
    return data;
  }

  //categoryni olib kelish
  List<ProCategory> _categories = new List();
  Future<void> getApiCategoryList() async {
    Network.GET(Network.API_CATEGORY, Network.paramEmpty())
        .then((response) {
      if (response != null) {
        _categories = Network.parseCategoryList(response).category;
      }
      getCategoryName();
    });
    notifyListeners();
  }

  List<ProCategory> get categories {
    return _categories;
  }

  // bu shart emas shekili
  List<String> _categoryTexts = new List();

  void getCategoryName() {
    for (int i = 0; i < _categories.length; i++) {
      _categoryTexts.add((_categories[i].name));
    }
    notifyListeners();
  }

  List<String> get categoryTexts {
    return _categoryTexts;
  }
}

class ProCategory {
  int id;
  String name;
  List<Children> children;

  ProCategory({this.id, this.name, this.children});

  ProCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['children'] != null) {
      children = new List<Children>();
      json['children'].forEach((v) {
        children.add(new Children.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.children != null) {
      data['children'] = this.children.map((children) => children.toJson()).toList();
    }
    return data;
  }
}

class Children {
  int id;
  String name;
  List children;

  Children({this.id, this.name, this.children});

  Children.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['children'] != null) {
      children = new List();
      json['children'].forEach((v) {
        children.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.children != null) {
      data['children'] = this.children.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


