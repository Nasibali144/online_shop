class CategoryList{
  List<Category> categories;

  CategoryList.fromJson(List<dynamic> json)
  : categories = List<Category>.from(json.map((x) => Category.fromJson(x)));

  List<dynamic> toJson() => [
    List<Category>.from(categories.map((x) => x.toJson()))
  ];
}

class Category {
  int id;
  String name;

  Category({this.id, this.name});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

