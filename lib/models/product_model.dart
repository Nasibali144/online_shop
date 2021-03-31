import 'category_model.dart';

class Product {
  String name;
  String price;
  String image;
  List<Category> category;
  String description;
  String slug;

  Product(
      {this.name,
        this.price,
        this.image,
        this.category,
        this.description,
        this.slug});

  Product.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    image = json['image'];
    if (json['category'] != null) {
      category = new List<Category>();
      json['category'].forEach((v) {
        category.add(new Category.fromJson(v));
      });
    }
    description = json['description'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['price'] = this.price;
    data['image'] = this.image;
    if (this.category != null) {
      data['category'] = this.category.map((v) => v.toJson()).toList();
    }
    data['description'] = this.description;
    data['slug'] = this.slug;
    return data;
  }
}


class ProductList{
  List<Product> products;

  ProductList.fromJson(List<dynamic> json)
      : products = List<Product>.from(json.map((x) => Product.fromJson(x)));

  List<dynamic> toJson() => [
    List<Product>.from(products.map((x) => x.toJson()))
  ];
}