import 'package:flutter/material.dart';
import 'package:online_shop/pages/add_address_page.dart';
import 'package:online_shop/pages/add_bank_card_page.dart';
import 'package:online_shop/pages/address_list_page.dart';
import 'package:online_shop/pages/cart_page.dart';
import 'package:online_shop/pages/change_address_page.dart';
import 'package:online_shop/pages/create_account_page.dart';
import 'package:online_shop/pages/detail_page.dart';
import 'package:online_shop/pages/drawer/answer_question_page.dart';
import 'package:online_shop/pages/drawer/approve_order_page.dart';
import 'package:online_shop/pages/drawer/card_types_page.dart';
import 'package:online_shop/pages/drawer/choose_dictrict_page.dart';
import 'package:online_shop/pages/drawer/choose_payment_page.dart';
import 'package:online_shop/pages/drawer/delivery_type_page.dart';
import 'package:online_shop/pages/drawer/products_catalogs_page.dart';
import 'package:online_shop/pages/drawer/public_offer_page.dart';
import 'package:online_shop/pages/fast_delivery_page.dart';
import 'package:online_shop/pages/favorite_products_page.dart';
import 'package:online_shop/pages/home_page.dart';
import 'package:online_shop/pages/intro_page.dart';
import 'package:online_shop/pages/product_list_page.dart';
import 'package:online_shop/pages/registration_with_phone.dart';
import 'package:online_shop/pages/registration_with_sms.dart';
import 'package:online_shop/pages/splash_page.dart';
import 'package:online_shop/pages/table_delivery_page.dart';
import 'package:online_shop/pages/viewed_products_page.dart';

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
        DetailPage.id: (context) => DetailPage(),
        ViewedProductPage.id: (context) => ViewedProductPage(),
        CartPage.id: (context) => CartPage(),
        AddBankCard.id: (context) => AddBankCard(),
        FavoriteProductsPage.id: (context) => FavoriteProductsPage(),
        AddressListPage.id: (context) => AddressListPage(),
        AddAddressPage.id: (context) => AddAddressPage(),
        ProductListPage.id: (context) => ProductListPage(),
        ChangeAddressPage.id: (context) => ChangeAddressPage(),
        FastDeliveryPage.id: (context) => FastDeliveryPage(),
        TableDeliveryPage.id: (context) => TableDeliveryPage(),
        QuestionAnswer.id: (context) => QuestionAnswer(),
        ApproveOrder.id: (context) => ApproveOrder(),
        CardTypes.id: (context) => CardTypes(),
        ChoseDistrict.id: (context) => ChoseDistrict(),
        ChosePayment.id: (context) => ChosePayment(),
        DeliveryType.id: (context) => DeliveryType(),
        ProductsCatalogue.id: (context) => ProductsCatalogue(),
        PublicOffer.id: (context) => PublicOffer(),
      },
    );
  }
}