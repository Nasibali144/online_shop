class BannerList {
  int count;
  String next;
  String previous;
  List<BannerModel> banners;

  BannerList({this.count, this.next, this.previous, this.banners});

  BannerList.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      banners = new List<BannerModel>();
      json['results'].forEach((v) {
        banners.add(new BannerModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['next'] = this.next;
    data['previous'] = this.previous;
    if (this.banners != null) {
      data['results'] = this.banners.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

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
