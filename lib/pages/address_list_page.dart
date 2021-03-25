import 'package:flutter/material.dart';
import 'package:online_shop/pages/add_address_page.dart';
import 'package:online_shop/pages/change_address_page.dart';
import 'package:online_shop/pages/home_page.dart';

class AddressListPage extends StatefulWidget {

  static final String id = 'address_list_page';

  @override
  _AddressListPageState createState() => _AddressListPageState();
}

class _AddressListPageState extends State<AddressListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: Text(
          "Manzillar ro'yxati",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pushReplacementNamed(context, HomePage.id);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // # card
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, ChangeAddressPage.id);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 1),
                child: ListTile(
                  tileColor: Colors.white,
                  leading: Icon(Icons.home_outlined),
                  title: Text("Ehtirom ko'chasi",),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: Icon(Icons.add, size: 30,color: Colors.white,),
        onPressed: () {
          Navigator.pushNamed(context, AddAddressPage.id);
        },
      ),
    );
  }
}
