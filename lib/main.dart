import 'package:flutter/material.dart';
import 'package:online_shop/pages/address/add_address_page.dart';
import 'package:online_shop/pages/authentication/create_registration_page.dart';
import 'package:online_shop/pages/payment_delivery/add_bank_card_page.dart';
import 'package:online_shop/pages/address/address_list_page.dart';
import 'package:online_shop/pages/product/cart_page.dart';
import 'package:online_shop/pages/address/change_address_page.dart';
import 'package:online_shop/pages/authentication/create_account_page.dart';
import 'package:online_shop/pages/product/detail_page.dart';
import 'package:online_shop/pages/drawer/answer_question_page.dart';
import 'package:online_shop/pages/payment_delivery/approve_order_page.dart';
import 'package:online_shop/pages/payment_delivery/card_types_page.dart';
import 'package:online_shop/pages/address/choose_dictrict_page.dart';
import 'package:online_shop/pages/payment_delivery/choose_payment_page.dart';
import 'package:online_shop/pages/payment_delivery/delivery_type_page.dart';
import 'package:online_shop/pages/product/products_catalogs_page.dart';
import 'package:online_shop/pages/drawer/public_offer_page.dart';
import 'package:online_shop/pages/payment_delivery/fast_delivery_page.dart';
import 'package:online_shop/pages/product/favorite_products_page.dart';
import 'package:online_shop/pages/home_page.dart';
import 'package:online_shop/pages/intro/intro_page.dart';
import 'package:online_shop/pages/product/product_list_page.dart';
import 'package:online_shop/pages/authentication/registration_with_phone.dart';
import 'package:online_shop/pages/authentication/registration_with_sms.dart';
import 'package:online_shop/pages/intro/splash_page.dart';
import 'package:online_shop/pages/payment_delivery/table_delivery_page.dart';
import 'package:online_shop/pages/product/viewed_products_page.dart';

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
      //home: CreateAccount(),
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
        //


        //
        CreateRegistrationPage.id: (context) => CreateRegistrationPage(),
      },
    );
  }
}