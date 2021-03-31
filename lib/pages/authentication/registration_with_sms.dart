import 'package:flutter/material.dart';
import 'package:online_shop/pages/authentication/create_account_page.dart';

class SmsCodePage extends StatefulWidget {

  static final String id = "registration_with_sms";
  final String phone;

  SmsCodePage({this.phone});

  @override
  _SmsCodePageState createState() => _SmsCodePageState();
}

class _SmsCodePageState extends State<SmsCodePage> {


  // ### bag ### sms kodni tekshirish

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            // #number
            SizedBox(height: 75,),
            Text(widget.phone, style: TextStyle(fontSize: 25,),),

            // #text
            SizedBox(height: 20,),
            Text("Sizga kodni SMS orqali jo'natdik", style: TextStyle(fontSize: 20),),
            SizedBox(height: 35,),

            // #textfield
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                //controller: phoneController,
                cursorColor: Colors.green,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: "SMS da kelgan kodni kiriting",
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

            // #button
            SizedBox(height: 25,),
            Container(
              height: 50,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 45),
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(5)
              ),
              child: FlatButton(
                textColor: Colors.white,
                child: Text('DAVOM ETTIRISH', style: TextStyle(fontSize: 18),),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, CreateAccount.id);
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}
