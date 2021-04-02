import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:online_shop/models/banner_model.dart';
import 'package:online_shop/services/http_service.dart';

class TestPage extends StatefulWidget {

  static final String id = "test_page";

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  List<String> imagesReklama = new List();

  BannerList _banners;

  _getBannerList() {
    Network.GET(Network.API_BANNER, Network.paramEmpty()).then((response) {
      _banners = Network.parseBanners(response);

      for(BannerModel banner in _banners.banners) {
        setState(() {
          imagesReklama.add(banner.image.toString());
        });
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getBannerList();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _swiper(),
    );
  }

  Widget _itemOfList(String image) {
    return Container(
      width: double.infinity,
      height: 220,
      child: Image.network(
        image,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _swiper() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width * 603 / 1922,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Color(0xFFccdef7),
            offset: Offset(15.0, 15.0),
            blurRadius: 30.0,
            spreadRadius: 1.0),
      ]),
      child: new Swiper(
        autoplay: true,
        autoplayDelay: 3000,
        layout: SwiperLayout.DEFAULT,
        itemCount: imagesReklama.length,
        itemBuilder: (BuildContext context, int index) {
          return Image(image: NetworkImage(imagesReklama[index]));
        },
      ),
    );
  }
}
