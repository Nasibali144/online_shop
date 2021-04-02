import 'category_model.dart';

class Product {
  int id;
  String name;
  String price;
  String image;
  String description;
  String slug;
  bool isSale;
  int category;

  Product(
      {this.id,
        this.name,
        this.price,
        this.image,
        this.description,
        this.slug,
        this.isSale,
        this.category});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    image = json['image'];
    description = json['description'];
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
    data['slug'] = this.slug;
    data['is_sale'] = this.isSale;
    data['category'] = this.category;
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