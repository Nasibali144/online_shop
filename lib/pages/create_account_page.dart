import 'package:flutter/material.dart';
import 'package:online_shop/pages/home_page.dart';
import 'package:online_shop/widgets/dialog_widget.dart';

class CreateAccount extends StatefulWidget {
  static final String id = 'create_account_page';

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  // ### bag ###


  String gender = 'Jinsingiz';

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
        child: SingleChildScrollView(
          child: Column(
            children: [

              // #ism
              TextField(
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

              // # jinsi
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

              // # nomer
              Container(
                height: 55,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.green),)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Telefon nomeringiz', style: TextStyle(color: Colors.grey),),
                    SizedBox(height: 5,),
                    Text('+9989__ ___ __ __', style: TextStyle(fontSize: 18, color: Colors.black),),
                    SizedBox(height: 10,)
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),

              // #email
              TextField(
                cursorColor: Colors.green,
                autofocus: true,
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
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, HomePage.id);
                  },
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
