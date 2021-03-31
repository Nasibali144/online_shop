import 'package:flutter/material.dart';

class AddBankCard extends StatefulWidget {

  static final String id = 'add_bank_card';

  @override
  _AddBankCardState createState() => _AddBankCardState();
}

class _AddBankCardState extends State<AddBankCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined, color: Colors.black, size: 30,),
          onPressed: () {},
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
                cursorColor: Colors.green,
                decoration: InputDecoration(
                  hintText: 'Karta amal qilish muddati',
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
                child: Text('DAVOM ETTIRISH', style: TextStyle(fontSize: 18),),
                onPressed: () {
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
