import 'dart:io';

import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:online_shop/models/account/user_data.dart';
import 'package:online_shop/models/account/user_model.dart';
import 'package:online_shop/pages/home_page.dart';
import 'package:online_shop/services/http_auth.dart';
import 'package:online_shop/services/http_cart.dart';
import 'package:online_shop/services/pref_service.dart';
import 'package:online_shop/utils/dialog_util.dart';
import 'package:online_shop/utils/msg_util.dart';
import 'package:provider/provider.dart';

class CreateAccount extends StatefulWidget {
  static final String id = 'create_account_page';

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  // date
  final format1 = DateFormat("yyyy-MM-dd");

  bool isLoading = false;

  List<String> genderList = [
    'Erkak',
    'Ayol',
  ];
  String gender;
  var usernameController = TextEditingController();
  var first_nameController = TextEditingController();
  var last_nameController = TextEditingController();
  var emailController = TextEditingController();
  var phone_numberController = TextEditingController();
  var birth_dateController = TextEditingController();

  void _apiUpdate(User user) {
    HttpAuth.PUT(HttpAuth.API_USER_UPDATE, HttpAuth.paramUpdate(user), HttpAuth.headersWithToken(context)).then((response) {
      print("Put dagi response: ${response.toString()}");
      _checkResponse(response);
    });
  }

  _checkResponse(Map<String, String> response){
    if(response.containsKey('success'))
    {
      User _user = HttpAuth.parseUser(response['success']);
      Provider.of<UserData>(context, listen: false).storeUser(_user);
      print(_user.username);

      // cart yaratib ketadi
      setState(() {
        isLoading = false;
      });
      HttpCart.POST(HttpCart.API_CART_CREATE, HttpCart.paramEmpty(), HttpCart.headersWithToken(context)).then((response) {
        print("Create Cart: $response");
        int id = HttpCart.parseCart(response).id;
        print("Create CartId: $id");
        Pref.storeCartId(id);
      });

      MsgUtil.fireToast("Ma'lumotlaringiz 'Mening profilim' bo'limga saqlandi!");
      Navigator.of(context).pushReplacementNamed(HomePage.id);
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

  _doRegistration() {
    String username = usernameController.text.trim().toString();
    String email = emailController.text.trim().toString();
    String first_name = first_nameController.text.trim().toString();
    String last_name = last_nameController.text.trim().toString();
    String phone_number = phone_numberController.text.trim().toString();
    String birth_date = birth_dateController.text.trim().toString();
    String _gender = gender == "Ayol" ? "female" : "male";

    setState(() {
      isLoading = true;
    });

    if(username.isNotEmpty && email.isNotEmpty && first_name.isNotEmpty && last_name.isNotEmpty && phone_number.isNotEmpty && birth_date.isNotEmpty) {
      var _user  = User(username: username, email: email, first_name: first_name, last_name: last_name, phone_number: phone_number, birth_date: birth_date, gender: _gender);
      _apiUpdate(_user);
    } else {
      setState(() {
        isLoading = false;
      });
      MsgUtil.fireToast("Iltimos barchmaydonlarni to'ldiring");
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      this._getOldPageData();
    });

  }


  void _getOldPageData() {
    setState(() {
      var user = Provider.of<UserData>(context, listen: false).user;
      if(user != null){
        usernameController.text = user.username;
        emailController.text = user.email;

        if(user.id != null) {
          first_nameController.text = user.first_name;
          last_nameController.text = user.last_name;
          birth_dateController.text = user.birth_date;
          phone_numberController.text = user.phone_number;
          gender = user.gender == 'male' ? 'Erkak': 'Ayol';
        }
      }
    });
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
          'Mening profilim',
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
                    //autofocus: true,
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

                  // #firstname
                  TextField(
                    controller: first_nameController,
                    cursorColor: Colors.green,
                    decoration: InputDecoration(
                      labelText: "Ismingiz",
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

                  // #lastname
                  TextField(
                    controller: last_nameController,
                    cursorColor: Colors.green,
                    decoration: InputDecoration(
                      labelText: "Familiyangiz",
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
                      labelText: "Elektron pochta manzilingiz",
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
                  SizedBox(height: 10,),

                  // #phone_number
                  TextField(
                    controller: phone_numberController,
                    cursorColor: Colors.green,
                    decoration: InputDecoration(
                      labelText: "Telefon nomeringiz",
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
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(height: 10,),

                  // #gender
                  Container(
                    height: 65,
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.green),)
                    ),
                    child: DropdownButtonFormField(
                      style: TextStyle(color: Colors.black, fontSize: 18),
                      elevation: 2,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          filled: true,
                          hintStyle: TextStyle(color: Colors.grey,
                              fontSize: 18,
                              fontWeight: FontWeight.w300),
                          hintText: "Jinsingiz",
                        fillColor: Colors.transparent
                      ),
                      value: gender,
                      onChanged: (String value) {
                        setState(() {
                          gender = value;
                        });
                      },
                      items: genderList
                          .map((_gender) => DropdownMenuItem(
                          value: _gender, child: Text("$_gender", style: TextStyle(color: Colors.black, fontSize: 18),)))
                          .toList(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  // #birth_date
                  /*TextField(
                    controller: birth_dateController,
                    cursorColor: Colors.green,
                    decoration: InputDecoration(
                      labelText: "Tug'ilgan kuningiz",
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
                    keyboardType: TextInputType.datetime,
                  ),*/
                  DateTimeField(
                    controller: birth_dateController,
                    decoration: InputDecoration(
                      labelText: "Tug'ilgan kuningiz",
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
                    format: format1,
                    onShowPicker: (context, currentValue) {
                      return showDatePicker(
                          context: context,
                          firstDate: DateTime(1900),
                          initialDate: currentValue ?? DateTime.now(),
                          lastDate: DateTime(2050));
                    },
                  ),
                  SizedBox(height: 25,),

                  // #button
                  Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: FlatButton(
                      textColor: Colors.white,
                      child: Text('DAVOM ETTIRISH', style: TextStyle(fontSize: 18),),
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
