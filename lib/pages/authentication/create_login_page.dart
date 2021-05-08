import 'dart:io';
import 'package:flutter/material.dart';
import 'package:online_shop/models/account/user_model.dart';
import 'package:online_shop/pages/authentication/create_registration_page.dart';
import 'package:online_shop/pages/home_page.dart';
import 'package:online_shop/services/http_auth.dart';
import 'package:online_shop/services/manage_route.dart';
import 'package:online_shop/services/pref_service.dart';
import 'package:online_shop/utils/dialog_util.dart';
import 'package:online_shop/utils/msg_util.dart';
import 'package:provider/provider.dart';
import 'package:online_shop/models/account/user_data.dart';

// ignore: must_be_immutable
class CreateLoginPage extends StatelessWidget {

  static final String id = "create_login_page";

  var usernameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();


  void _apiCreate(User user, BuildContext context) {
    HttpAuth.POST(HttpAuth.API_LOGIN_CREATE, HttpAuth.paramCreateForLogin(user), HttpAuth.headers).then((response) {
      print('Response my api:  $response');
      _checkResponse(response, context);
    });
  }

  _checkResponse(Map<String, String> response, BuildContext context){

    if(response.containsKey('success'))
    {
      Map _json = HttpAuth.parseApiKey(response['success']);
      print(_json['key']);
      Provider.of<UserData>(context, listen: false).storeToken(_json['key']);
      Provider.of<UserData>(context, listen: false).loadingProgress();

      //// for Auth Status
      Pref.removeAuthStatus().then((value) {
        if(value) {
          Pref.storeAuthStatus(AuthStatus.LOGGED_IN);
          print("Login Page: Auth Status Store => and load it: ${Pref.loadAuthStatus()}");
        } else {
          exit(0);
        }
      });
      ////### bag###
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => HomePage()
      ));
    } else if(response.containsKey('error')) {
      List errors = HttpAuth.errorMessage(response['error']);
      var text = '';
      for(var item in errors) {
        text += item.toString();
        text += " ";
      }

      Provider.of<UserData>(context, listen: false).loadingProgress();

      MsgUtil.fireToast(text);

    } else {
      Provider.of<UserData>(context, listen: false).loadingProgress();
      DialogUtils.dialogShow(
        title: "Uzr tizimda xatolik",
        content: "Dasturni qayta ishga tushurishingizni so'raymiz!",
        context: context,
        button: 'Dasturdan chiqish',
      );
      exit(0);
    }
  }

  _doRegistration(BuildContext  context) {
    String username = usernameController.text.trim().toString();
    String email = emailController.text.trim().toString();
    String password = passwordController.text.trim().toString();

      Provider.of<UserData>(context, listen: false).loadingProgress();

    if(username.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
      User _user = User(username: username, email: email, password: password);
      Provider.of<UserData>(context, listen: false).user = _user;
      _apiCreate(_user, context);
    } else {
      Provider.of<UserData>(context, listen: false).loadingProgress();
      MsgUtil.fireToast("Iltimos barcha maydonlarni to'ldiring");
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
          'Tizimga kirish',
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
                    controller: passwordController,
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
                        'TIZIMGA KIRISH',
                        style: TextStyle(fontSize: 18),
                      ),
                      onPressed: () {
                        _doRegistration(context);
                      },
                    ),
                  ),
                  SizedBox(height: 30,),

                  // #navigate
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, CreateRegistrationPage.id);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Ro'yxatdan o'tmaganmisiz? ",),
                        Text("Ro'yxatdan o'tish", style: TextStyle( color: Colors.blue),)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Provider.of<UserData>(context).isLoading ? Center(child: CircularProgressIndicator()) : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
