import 'package:flutter/material.dart';

class DrawerOne extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            margin: EdgeInsets.all(0),
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/splash/datasite_logo.png"),
                      fit: BoxFit.scaleDown)),
            ),
          ),
          Container(
            color: Colors.white,
            child: ListTile(
              leading: Icon(
                Icons.location_on,
                color: Colors.red,
              ),
              title: Text('Kompaniyani ozgartirish'),
            ),
          ),
          Container(
            color: Colors.white,
            child: ListTile(
              leading: Icon(
                Icons.menu,
                color: Colors.blue.shade300,
              ),
              title: Text('Mxsulotlar Katalogi'),
            ),
          ),
          SizedBox(height: 10),
          Container(
            color: Colors.white,
            height: 20,
          ),
          Container(
            color: Colors.white,
            child: ListTile(
              leading: Icon(
                Icons.call,
                color: Colors.green,
              ),
              title: Text('Biz bilan boglanish'),
            ),
          ),
          Container(
            color: Colors.white,
            child: ListTile(
              leading: Icon(Icons.question_answer),
              title: Text('Kop Soraladigan savollarga javob'),
            ),
          ),
          Container(
            color: Colors.white,
            child: ListTile(
              leading: Icon(
                Icons.now_wallpaper,
                color: Colors.orange,
              ),
              title: Text('Ommaviy Oferta'),
            ),
          ),
          Container(
            color: Colors.white,
            child: ListTile(
              leading: Icon(
                Icons.language,
                color: Colors.lightBlueAccent,
              ),
              title: Text('Til'),
            ),
          ),
          SizedBox(height: 10),
          Container(
            color: Colors.white,
            child: ListTile(
              leading: Icon(
                Icons.exit_to_app_rounded,
                color: Colors.indigo,
              ),
              title: Text('Tizimga Kirish'),
            ),
          ),
        ],
      ),
    );
  }
}