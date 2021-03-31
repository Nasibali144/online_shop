class Banner {
  int id;
  String image;

  Banner({this.id, this.image});

  Banner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    return data;
  }
}

class BannerList{
  List<Banner> banners;

  BannerList.fromJson(List<dynamic> json)
      : banners = List<Banner>.from(json.map((x) => Banner.fromJson(x)));

  List<dynamic> toJson() => [
    List<Banner>.from(banners.map((x) => x.toJson()))
  ];
}