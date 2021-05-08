import 'package:flutter/material.dart';
import 'package:online_shop/models/bank_card_model.dart';
import 'package:online_shop/pages/payment_delivery/bank_card_list_page.dart';
import 'package:online_shop/utils/msg_util.dart';
import 'package:provider/provider.dart';

class AddBankCard extends StatefulWidget {

  static final String id = 'add_bank_card';

  @override
  _AddBankCardState createState() => _AddBankCardState();
}

class _AddBankCardState extends State<AddBankCard> {

  var cardNumberController = TextEditingController();
  var validityPeriodController = TextEditingController();

  _addBankCard() {
    String cardNumber = cardNumberController.text.trim().toString();
    String validityPeriod = validityPeriodController.text.trim().toString();

    // bank kartasiga validation bo'lishi kerak
    if(cardNumber.length == 16 && validityPeriod.length == 5) {
      Provider.of<BankCardList>(context, listen: false).addItem(bankCard: BankCard(cardNumber: cardNumber, validityPeriod: validityPeriod));
      MsgUtil.fireToast("Saqlandi!");
      Navigator.pushReplacementNamed(context, BankCardListPage.id);
    } else {
      MsgUtil.fireToast("Iltimos barcha maydonlarni to'gri to'ldiring");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined, color: Colors.black, size: 30,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Kartani qo'shish", style: TextStyle(color: Colors.black,),),
        backgroundColor: Colors.white,
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              child: TextField(
                controller: cardNumberController,
                cursorColor: Colors.green,
                decoration: InputDecoration(
                  hintText: 'Karta raqami',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 18, fontWeight: FontWeight.w300),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                ),
                style: TextStyle(color: Colors.black, fontSize: 18),
                keyboardType: TextInputType.phone,
              ),
            ),
            SizedBox(height: 20,),
            Container(
              child: TextField(
                controller: validityPeriodController,
                cursorColor: Colors.green,
                decoration: InputDecoration(
                  hintText: 'Karta amal qilish muddati',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 18, fontWeight: FontWeight.w300),
                  helperText: '00/00',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                ),
                style: TextStyle(color: Colors.black, fontSize: 18),
                keyboardType: TextInputType.phone,
              ),
            ),
            SizedBox(height: 80,),
            Container(
              height: 50,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 65),
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(5)
              ),
              child: FlatButton(
                textColor: Colors.white,
                child: Text('Saqlash', style: TextStyle(fontSize: 18),),
                onPressed: _addBankCard,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
