import 'dart:async';
import 'package:flutter/material.dart';
import 'package:online_shop/models/account/user_data.dart';
import 'package:online_shop/pages/intro/intro_page.dart';
import 'package:online_shop/services/manage_route.dart';
import 'package:online_shop/services/pref_service.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {

  static final String id = 'splash_page';

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin{


  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
            () => ManageNavigation.manageRoute(context));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset('assets/images/splash/datasite_brend.jpg',),
      ),
    );
  }
}
