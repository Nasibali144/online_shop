import 'package:flutter/material.dart';
import 'package:online_shop/pages/create_account_page.dart';
import 'package:online_shop/pages/home_page.dart';
import 'package:online_shop/pages/intro_page.dart';
import 'package:online_shop/pages/registration_with_phone.dart';
import 'package:online_shop/pages/registration_with_sms.dart';
import 'package:online_shop/pages/splash_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashPage(),
      routes: {
        HomePage.id: (context) => HomePage(),
        IntroPage.id: (context) => IntroPage(),
        SplashPage.id: (context) => SplashPage(),
        RegistrationPage.id: (context) => RegistrationPage(),
        SmsCodePage.id: (context) => SmsCodePage(),
        CreateAccount.id: (context) => CreateAccount(),
      },
    );
  }
}