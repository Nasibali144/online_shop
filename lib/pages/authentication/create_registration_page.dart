import 'dart:io';
import 'package:flutter/material.dart';
import 'package:online_shop/models/account/user_data.dart';
import 'package:online_shop/models/account/user_model.dart';
import 'package:online_shop/pages/authentication/create_login_page.dart';
import 'package:online_shop/pages/home_page.dart';
import 'package:online_shop/services/http_auth.dart';
import 'package:online_shop/services/http_cart.dart';
import 'package:online_shop/services/manage_route.dart';
import 'package:online_shop/services/pref_service.dart';
import 'package:online_shop/utils/dialog_util.dart';
import 'package:online_shop/utils/msg_util.dart';
import 'package:provider/provider.dart';
import 'create_account_page.dart';

class CreateRegistrationPage extends StatefulWidget {

  static final String id = "create_registration_page";

  @override
  _CreateRegistrationPageState createState() => _CreateRegistrationPageState();
}

class _CreateRegistrationPageState extends State<CreateRegistrationPage> {

  bool isLoading = false;

  var usernameController = TextEditingController();
  var emailController = TextEditingController();
  var password1Controller = TextEditingController();
  var password2Controller = TextEditingController();


  _doRegistration() {
    String username = usernameController.text.trim().toString();
    String email = emailController.text.trim().toString();
    String password1 = password1Controller.text.trim().toString();
    String password2 = password2Controller.text.trim().toString();

    setState(() {
      isLoading = true;
    });

    if(password2 == password1 && username.isNotEmpty && email.isNotEmpty && password1.isNotEmpty) {
      User _user = User(username: username, email: email, password: password1);
      Provider.of<UserData>(context, listen: false).user = _user;
      _apiCreate(_user);
    } else {
      setState(() {
        isLoading = false;
      });
      MsgUtil.fireToast("Iltimos barcha maydonlarni to'g'ri to'ldiring");
    }
  }

  void _apiCreate(User user) {
    HttpAuth.POST(HttpAuth.API_REGISTRATION_CREATE, HttpAuth.paramCreate(user), HttpAuth.headers).then((response) {
      print('Response my api:  $response');
      _checkResponse(response);
    });
  }

  _checkResponse(Map<String, String> response){

    if(response.containsKey('success'))
    {
      Map _json = HttpAuth.parseApiKey(response['success']);
      print(_json['key']);
      Provider.of<UserData>(context, listen: false).storeToken(_json['key']);
      setState(() {
        isLoading = false;
      });


      //// for Auth Status
      Pref.removeAuthStatus().then((value) {
        if(value) {
         Pref.storeAuthStatus(AuthStatus.LOGGED_IN);
         print("Create Registration Page: Auth Status Store => and load it: ${Pref.loadAuthStatus()}");
        } else {
          exit(0);
        }
      });
      ////### bag###
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => CreateAccount()
      ));
    } else if(response.containsKey('error')) {
      List errors = HttpAuth.errorMessage(response['error']);
      var text = '';
      for(var item in errors) {
        text += item;
        text += " ";
      }

      setState(() {
        isLoading = false;
      });

      MsgUtil.fireToast(text);
    } else {
      setState(() {
        isLoading = false;
      });
      DialogUtils.dialogShow(
        title: "Uzr tizimda xatolik",
        content: "Dasturni qayta ishga tushurishingizni so'raymiz!",
        context: context,
        button: 'Dasturdan chiqish',
      );
      exit(0);
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

                  // #username
                  TextField(
                    controller: usernameController,
                    cursorColor: Colors.green,
                    decoration: InputDecoration(
                      labelText: "Foydalanuvchi nomi",
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

                  // #email
                  TextField(
                    controller: emailController,
                    cursorColor: Colors.green,
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
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  // #password
                  TextField(
                    controller: password1Controller,
                    cursorColor: Colors.green,
                    obscureText: true,
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
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  SizedBox(
                    height: 10,
                  ),


                  // #confirm password
                  TextField(
                    controller: password2Controller,
                    cursorColor: Colors.green,
                    obscureText: true,
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
                    keyboardType: TextInputType.visiblePassword,
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
                  SizedBox(height: 30,),

                  // #navigate
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, CreateLoginPage.id);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Allaqachon ro'yxatdan o'tganmisiz? ",),
                        Text("Tizimga kirish", style: TextStyle( color: Colors.blue),)
                      ],
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
