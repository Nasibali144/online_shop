import 'package:flutter/material.dart';
import 'package:online_shop/models/bank_card_model.dart';
import 'package:online_shop/pages/payment_delivery/add_bank_card_page.dart';
import 'package:provider/provider.dart';

import 'approve_order_page.dart';

class BankCardListPage extends StatefulWidget {

  static final String id = 'bank_card_list_page';

  @override
  _BankCardListPageState createState() => _BankCardListPageState();
}

class _BankCardListPageState extends State<BankCardListPage> {

  @override
  Widget build(BuildContext context) {
    List<BankCard> bankCarts = Provider.of<BankCardList>(context).items;
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: Text( "To'lov kartalari",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        itemCount: bankCarts.length,
        itemBuilder: (context, index) {
          return ListTile(
            tileColor: Colors.white,
            title: Text(bankCarts[index].cardNumber, style: TextStyle(fontSize: 17, color: Colors.black),),
            trailing: Text(bankCarts[index].validityPeriod, style: TextStyle(fontSize: 16, color: Colors.grey[800]),),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ApproveOrder(msg: "Bank Kartasi", choiceCard: 'Uzcard: ${bankCarts[index].cardNumber.substring(12)}',)));
            },
          );
        } ,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: Icon(Icons.add, size: 30,color: Colors.white,),
        onPressed: () {
          Navigator.pushNamed(context, AddBankCard.id);
        },
      ),
    );
  }
}
