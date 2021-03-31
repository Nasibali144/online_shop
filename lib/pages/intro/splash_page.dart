import 'dart:async';
import 'package:flutter/material.dart';
import 'package:online_shop/pages/intro/intro_page.dart';

class SplashPage extends StatefulWidget {

  static final String id = 'splash_page';

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin{

  // _startPage() async{
  //   try {
  //     User user = await Prefs.loadUser();
  //     doLogin = await Prefs.loadLogin();
  //
  //     if(doLogin != null) {
  //       if(doLogin == true) {
  //         if(user.username.startsWith('client')) {
  //           Navigator.pushReplacementNamed(context, HomePage.id);
  //         } else {
  //           Navigator.pushReplacementNamed(context, HomePage.id);
  //         }
  //       } else {
  //         Navigator.pushReplacementNamed(context, SignInPage.id);
  //       }
  //     } else {
  //       print("Birinchi marta run qilinganda");
  //       Navigator.pushReplacementNamed(context, IntroPage.id);
  //     }
  //   } catch(e) {
  //     print('ERROR MESSAGES $doLogin');
  //     Navigator.pushReplacementNamed(context, IntroPage.id);
  //   }
  // }

  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
            () => Navigator.pushReplacement(context, new MaterialPageRoute(builder: (BuildContext context) { return IntroPage();})));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset('assets/images/splash/datasite_logo.png',),
      ),
    );
  }
}
