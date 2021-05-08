import 'dart:io';
import 'package:flutter/material.dart';
import 'package:online_shop/models/account/user_data.dart';
import 'package:online_shop/pages/address/address_list_page.dart';
import 'package:online_shop/pages/authentication/create_account_page.dart';
import 'package:online_shop/pages/authentication/create_registration_page.dart';
import 'package:online_shop/pages/drawer/answer_question_page.dart';
import 'package:online_shop/pages/drawer/public_offer_page.dart';
import 'package:online_shop/pages/product/favorite_products_page.dart';
import 'package:online_shop/pages/product/products_catalogs_page.dart';
import 'package:online_shop/pages/product/viewed_products_page.dart';
import 'package:online_shop/services/http_auth.dart';
import 'package:online_shop/services/manage_route.dart';
import 'package:online_shop/services/pref_service.dart';
import 'package:provider/provider.dart';

const DividerFor = Divider(
  height: 0,
  thickness: 0.5,
  indent: 70,
  endIndent: 0,
);

class DrawerTwo extends StatelessWidget {

  void _logOut(BuildContext context) {
    HttpAuth.POST(HttpAuth.API_LOGOUT_CREATE, HttpAuth.paramEmpty(), HttpAuth.headersWithToken(context)).then((response) {
      if(response.containsKey('success')) {
        Provider.of<UserData>(context, listen: false).removeUser();
        Provider.of<UserData>(context, listen: false).removeToken();

        //// for Auth Status
        Pref.removeAuthStatus().then((value) {
          if(value) {
            Pref.storeAuthStatus(AuthStatus.NOT_LOGGED_IN);
            print("Home Page: Auth Status Store => and load it: ${Pref.loadAuthStatus()}");
          } else {
            exit(0);
          }
        });

        ////####xatolik bo'lishi mumkin pop da####
        //Navigator.pop(context);
        Navigator.pushReplacementNamed(context, CreateRegistrationPage.id);
      } else {
        exit(0);
      }
    });
  }

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
                  color: Colors.white,
                  image: DecorationImage(
                    image: AssetImage("assets/images/splash/datasite_logo.png"),
                  )),
            ),
          ),
          // Container(
          //   color: Colors.white,
          //   child: ListTile(
          //     leading: Icon(
          //       Icons.location_on,
          //       color: Colors.red,
          //     ),
          //     title: Text('Kompaniyani ozgartirish'),
          //   ),
          // ),
          // DividerFor,
          Container(
            color: Colors.white,
            child: ListTile(
              onTap: () {
                Navigator.pushNamed(context, ProductsCatalogue.id);
              },
              leading: Icon(
                Icons.menu,
                color: Colors.blue.shade300,
              ),
              title: Text('Maxsulotlar Katalogi'),
            ),
          ),
          SizedBox(height: 15),
          Container(
            color: Colors.white,
            child: ListTile(
              leading: Icon(
                Icons.attach_money,
                color: Colors.yellow,
              ),
              title: Text('Hamyon'),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            color: Colors.white,
            child: ListTile(
              leading: Icon(
                Icons.card_travel,
                color: Colors.brown,
              ),
              title: Text('Buyurtmalarim Royxati'),
            ),
          ),
          DividerFor,
          Container(
            color: Colors.white,
            child: ListTile(
              onTap: () {
                Navigator.pushReplacementNamed(context, AddressListPage.id);
              },
              leading: Icon(
                Icons.alternate_email,
                color: Colors.purple,
              ),
              title: Text('Manzillarim Royxati'),
            ),
          ),
          DividerFor,
          Container(
            color: Colors.white,
            child: ListTile(
              leading: Icon(
                Icons.credit_card_outlined,
                color: Colors.blue,
              ),
              title: Text('Tolov kartalari'),
            ),
          ),
          Container(
            color: Colors.white,
            child: ListTile(
              onTap: () {
                Navigator.pushReplacementNamed(context, FavoriteProductsPage.id);
              },
              leading: Icon(
                Icons.star_border,
                color: Colors.yellow,
              ),
              title: Text('Sevimli mahsulotlarim'),
            ),
          ),
          DividerFor,
          Container(
            color: Colors.white,
            child: ListTile(
              onTap: () {
                Navigator.pushNamed(context, ViewedProductPage.id);
                //Navigator.pop(context);
              },
              leading: Icon(
                Icons.remove_red_eye,
                color: Colors.teal,
              ),
              title: Text('Korilgan mahsulotlari'),
            ),
          ),
          SizedBox(height: 15),
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
          DividerFor,
          Container(
            color: Colors.white,
            child: ListTile(
              onTap: () {
                Navigator.pushNamed(context, QuestionAnswer.id);
              },
              leading: Icon(Icons.question_answer),
              title: Text('Kop Soraladigan savollarga javob'),
            ),
          ),
          DividerFor,
          Container(
            color: Colors.white,
            child: ListTile(
              onTap: () {
                Navigator.pushNamed(context, PublicOffer.id);
              },
              leading: Icon(
                Icons.now_wallpaper,
                color: Colors.orange,
              ),
              title: Text('Ommaviy Oferta'),
            ),
          ),
          DividerFor,
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
          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, CreateAccount.id);
            },
            child: Container(
              color: Colors.white,
              child: ListTile(
                leading: Icon(
                  Icons.perm_identity_outlined,
                  color: Colors.redAccent,
                ),
                title: Text('Mening Profilim'),
              ),
            ),
          ),
          DividerFor,
          Container(
            color: Colors.white,
            child: ListTile(
              onTap: () {
                _logOut(context);
              },
              leading: Icon(
                Icons.exit_to_app_rounded,
                color: Colors.indigo,
              ),
              title: Text('Tizimdan chiqish'),
            ),
          ),
        ],
      ),
    );
  }
}