import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_shop/pages/registration_with_sms.dart';
import 'package:online_shop/widgets/dialog_widget.dart';

class RegistrationPage extends StatefulWidget {

  static final String id = 'registration_with_phone';

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {

  var phoneController = TextEditingController();

  // quyidagilar hali o'zgartiriladi
  // ### bag ### telefon raqam valid ekanligini tekshirish kerek;
  String getNumber() {
    String phone = phoneController.text.trim().toString();
    return phone;
  }

  function1() {
    String phone = phoneController.text.trim().toString();
    Navigator.pop(context);
    Navigator.of(context)
        .push(new MaterialPageRoute(builder: (BuildContext context) {
      return new SmsCodePage(phone: phone,);
    }));
    phoneController.clear();
  }

  function2() {
    phoneController.clear();
    Navigator.pop(context);
  }

  //////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          // #logo
          SizedBox(height: 80,),
          SvgPicture.asset(
              'assets/images/splash/datasite_logo.svg'
          ),

          // #text
          SizedBox(height: 30,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Text("Telefon raqamingizni kiriting, mamlakat kodi bilan: +998 ___ __ __",
              textAlign: TextAlign.center,
              style: TextStyle(
              fontSize: 18,
                fontWeight: FontWeight.w300
            ),),
          ),

          // #textfield
          SizedBox(height: 40,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 35, vertical: 15),
            child: TextField(
              controller: phoneController,
              cursorColor: Colors.green,
              autofocus: true,
              decoration: InputDecoration(
                hintText: 'Telefon raqamingiz',
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
                  DialogUtils.dialogShow(context: context, title: getNumber(), content: "Raqamingiz to'g'ri ko'rsatilganmi", function1: function1, function2: function2);
              },
            ),
          ),
        ],
      ),
    );
  }
}
