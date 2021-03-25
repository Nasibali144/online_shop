import 'package:flutter/material.dart';
import 'package:online_shop/pages/address_list_page.dart';
import 'package:online_shop/pages/create_account_page.dart';
import 'package:online_shop/pages/drawer/answer_question_page.dart';
import 'package:online_shop/pages/drawer/public_offer_page.dart';
import 'package:online_shop/pages/favorite_products_page.dart';
import 'package:online_shop/pages/viewed_products_page.dart';

const DividerFor = Divider(
  height: 0,
  thickness: 0.5,
  indent: 70,
  endIndent: 0,
);

class DrawerTwo extends StatelessWidget {

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
          DividerFor,
          GestureDetector(
            onTap: () {},
            child: Container(
              color: Colors.white,
              child: ListTile(
                leading: Icon(
                  Icons.menu,
                  color: Colors.blue.shade300,
                ),
                title: Text('Mxsulotlar Katalogi'),
              ),
            ),
          ),
          SizedBox(height: 15),
          GestureDetector(
            child: Container(
              color: Colors.white,
              child: ListTile(
                leading: Icon(
                  Icons.attach_money,
                  color: Colors.yellow,
                ),
                title: Text('Hamyon'),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          GestureDetector(
            child: Container(
              color: Colors.white,
              child: ListTile(
                leading: Icon(
                  Icons.card_travel,
                  color: Colors.brown,
                ),
                title: Text('Buyurtmalarim Royxati'),
              ),
            ),
          ),
          DividerFor,
          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, AddressListPage.id);
            },
            child: Container(
              color: Colors.white,
              child: ListTile(
                leading: Icon(
                  Icons.alternate_email,
                  color: Colors.purple,
                ),
                title: Text('Manzillarim Royxati'),
              ),
            ),
          ),
          DividerFor,
          GestureDetector(
            onTap: () {
              //Navigator.pushReplacementNamed(context, routeName);
            },
            child: Container(
              color: Colors.white,
              child: ListTile(
                leading: Icon(
                  Icons.credit_card_outlined,
                  color: Colors.blue,
                ),
                title: Text('Tolov kartalari'),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, FavoriteProductsPage.id);
            },
            child: Container(
              color: Colors.white,
              child: ListTile(
                leading: Icon(
                  Icons.star_border,
                  color: Colors.yellow,
                ),
                title: Text('Sevimli mahsulotlarim'),
              ),
            ),
          ),
          DividerFor,
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, ViewedProductPage.id);
              //Navigator.pop(context);
            },
            child: Container(
              color: Colors.white,
              child: ListTile(
                leading: Icon(
                  Icons.remove_red_eye,
                  color: Colors.teal,
                ),
                title: Text('Korilgan mahsulotlari'),
              ),
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
          GestureDetector(
            child: Container(
              color: Colors.white,
              child: ListTile(
                leading: Icon(
                  Icons.exit_to_app_rounded,
                  color: Colors.indigo,
                ),
                title: Text('Tizimdan chiqish'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}