class CategoryList{
  List<ProCategory> categories;

  CategoryList.fromJson(List<dynamic> json)
  : categories = List<ProCategory>.from(json.map((x) => ProCategory.fromJson(x)));

  List<dynamic> toJson() => [
    List<ProCategory>.from(categories.map((x) => x.toJson()))
  ];
}

class ProCategory {
  int id;
  String name;
  List<ProCategory> children;

  ProCategory({this.id, this.name, this.children});

  ProCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['children'] != null) {
      children = new List<ProCategory>();
      json['children'].forEach((v) {
        children.add(new ProCategory.fromJson(v));
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

