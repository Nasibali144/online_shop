import 'package:flutter/material.dart';
import 'package:online_shop/models/account/user_model.dart';
import 'package:online_shop/pages/home_page.dart';
import 'package:online_shop/services/http_auth.dart';
import 'package:online_shop/services/http_cart.dart';
import 'package:online_shop/services/pref_service.dart';

class CreateAccount extends StatefulWidget {
  static final String id = 'create_account_page';

  final String username;
  final String email;

  CreateAccount({this.username, this.email});

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {

  bool isLoading = false;

  String gender = 'Jinsingiz';
  String token;
  var usernameController = TextEditingController();
  var first_nameController = TextEditingController();
  var last_nameController = TextEditingController();
  var emailController = TextEditingController();
  var phone_numberController = TextEditingController();
  var birth_dateController = TextEditingController();

  void _apiUpdate(User user) {
    HttpAuth.PUT(HttpAuth.API_USER_UPDATE, HttpAuth.paramUpdate(user), token).then((response) {
      _checkResponse(response);
    });
  }

  _checkResponse(String response){
    User _user = HttpAuth.parseUser(response);
    Pref.storeUser(_user);
    print(_user.username);

    ////
    // cart yaratib ketadi
    setState(() {
      isLoading = false;
    });
    HttpCart.POST(HttpCart.BASE, HttpCart.paramEmpty(), token).then((value) {
      print(value);
    });
    ////
    Navigator.of(context).pushReplacementNamed(HomePage.id);
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
      _apiUpdate(User(username: username, email: email, first_name: first_name, last_name: last_name, phone_number: phone_number, birth_date: birth_date, gender: _gender));
    }
  }

  @override
  void initState() {
    super.initState();
    _getToken();
    _getOldPageData();
  }

  void _getToken() {
    Pref.loadToken().then((value) {
      setState(() {
        token = value;
      });
    });
  }

  void _getOldPageData() {
    setState(() {
      usernameController.text = widget.username;
      emailController.text = widget.email;
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
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.green),)
                    ),
                    child: ExpansionTile(
                        title: new Text(gender),
                        children: <Widget>[
                          new ListTile(
                            title: const Text('Erkak'),
                            onTap: () {
                              setState(() {
                                gender = 'Erkak';
                              });
                            },
                          ),
                          new ListTile(
                            title: const Text('Ayol'),
                            onTap: () {
                              setState(() {
                                gender = 'Ayol';
                              });
                            },
                          ),

                        ]
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  // #birth_date
                  TextField(
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
