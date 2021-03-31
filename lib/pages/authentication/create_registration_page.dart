import 'package:flutter/material.dart';
import 'package:online_shop/models/account/user_model.dart';
import 'package:online_shop/pages/home_page.dart';
import 'package:online_shop/services/http_auth.dart';
import 'package:online_shop/services/pref_service.dart';
import 'package:online_shop/widgets/dialog_widget.dart';

import 'create_account_page.dart';

class CreateRegistrationPage extends StatefulWidget {

  static final String id = "create_registration_page";

  @override
  _CreateRegistrationPageState createState() => _CreateRegistrationPageState();
}

class _CreateRegistrationPageState extends State<CreateRegistrationPage> {

  bool isLoading = false;
  ////
  String token;
  ////

  var usernameController = TextEditingController();
  var emailController = TextEditingController();
  var password1Controller = TextEditingController();
  var password2Controller = TextEditingController();


  void _apiCreate(User user) {
    HttpAuth.POST(HttpAuth.API_REGISTRATION_CREATE, HttpAuth.paramCreate(user)).then((response) {
      print('Response my api:  $response');
      _checkResponse(response);
    });
  }

  _checkResponse(String response){
    Map _json = HttpAuth.parseApiKey(response);
    Pref.storeToken(_json['key']);
    print(_json['key']);
    token = _json['key'];

    setState(() {
      isLoading = false;
    });

    ////### bag###
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => CreateAccount(username: usernameController.text.trim().toString(), email: emailController.text.trim().toString(),)
    ));
  }

  _doRegistration() {
    String username = usernameController.text.trim().toString();
    String email = emailController.text.trim().toString();
    String password1 = password1Controller.text.trim().toString();
    String password2 = password1Controller.text.trim().toString();

    setState(() {
      isLoading = true;
    });

    if(username.isNotEmpty && email.isNotEmpty && password1.isNotEmpty && (password2 == password1)) {
      _apiCreate(User(username: username, email: email, password: password1));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            //registration qilinmagan home Pagega o'tsin
            Navigator.pushReplacementNamed(context, HomePage.id);
          },
        ),
        title: Text(
          'Registratsiya',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  // #ism
                  TextField(
                    controller: usernameController,
                    cursorColor: Colors.green,
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: "To'liq ism sharifingiz",
                      labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                          fontWeight: FontWeight.w300),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      ),
                    ),
                    style: TextStyle(color: Colors.black, fontSize: 18),
                    keyboardType: TextInputType.name,
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  TextField(
                    controller: emailController,
                    cursorColor: Colors.green,
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: "Emailingizni kiriting",
                      labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                          fontWeight: FontWeight.w300),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      ),
                    ),
                    style: TextStyle(color: Colors.black, fontSize: 18),
                    keyboardType: TextInputType.name,
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: password1Controller,
                    cursorColor: Colors.green,
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: "Parolingizni kiriting",
                      labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                          fontWeight: FontWeight.w300),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      ),
                    ),
                    style: TextStyle(color: Colors.black, fontSize: 18),
                    keyboardType: TextInputType.name,
                  ),

                  // # nomer

                  SizedBox(
                    height: 10,
                  ),
                  // #email
                  TextField(
                    controller: password2Controller,
                    cursorColor: Colors.green,
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: "Parolingizni tasdiqlang",
                      labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                          fontWeight: FontWeight.w300),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      ),
                    ),
                    style: TextStyle(color: Colors.black, fontSize: 18),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: 25,
                  ),

                  // #button
                  Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(5)),
                    child: FlatButton(
                      textColor: Colors.white,
                      child: Text(
                        'DAVOM ETTIRISH',
                        style: TextStyle(fontSize: 18),
                      ),
                      onPressed: _doRegistration,
                    ),
                  ),
                ],
              ),
            ),

            isLoading ? Center(child: CircularProgressIndicator()) : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
