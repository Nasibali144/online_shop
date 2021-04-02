class BannerModel {
  int id;
  String image;

  BannerModel({this.id, this.image});

  BannerModel.fromJson(Map<String, dynamic> json) {
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

class BannerList {
  List<BannerModel> banners;

  BannerList.fromJson(List<dynamic> json)
      : banners = List<BannerModel>.from(json.map((x) => BannerModel.fromJson(x)));

  List<dynamic> toJson() => [
    List<BannerModel>.from(banners.map((x) => x.toJson()))
  ];
}