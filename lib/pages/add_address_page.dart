import 'package:flutter/material.dart';
import 'package:online_shop/pages/address_list_page.dart';
import 'drawer/choose_dictrict_page.dart';

class AddAddressPage extends StatefulWidget {

  static final String id = "add_address_page";

  @override
  _AddAddressPageState createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
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
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Yangi manzil',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // # tumannni tanlang
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, ChoseDistrict.id);
                },
                child: Container(
                  height: 55,
                  width: double.infinity,
                  padding: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.green),)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('Tumanni tanlang', style: TextStyle(fontSize: 18, color: Colors.grey),),
                      Icon(Icons.arrow_forward_ios, color: Colors.green,)
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),

              // # mo'ljalni tanlang
              Container(
                height: 55,
                width: double.infinity,
                padding: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.green),)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("Mo'ljalni tanlang", style: TextStyle(fontSize: 18, color: Colors.grey),),
                    Icon(Icons.arrow_forward_ios, color: Colors.green,)
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),

              // #ism
              TextField(
                cursorColor: Colors.green,
                decoration: InputDecoration(
                  labelText: "Ko'changiz va uyingiz raqamini kiriting",
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

              // # mo'ljalni tanlang
              Container(
                height: 55,
                width: double.infinity,
                padding: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.green),)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("Manzilni xarita orqali kiritish", style: TextStyle(fontSize: 18, color: Colors.grey),),
                    Icon(Icons.arrow_forward_ios, color: Colors.green,)
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),

              // #izoh
              TextField(
                cursorColor: Colors.green,
                maxLines: 2,
                minLines: 1,
                decoration: InputDecoration(
                  labelText: "Izoh: Kvartira raqami, eshik kodi, pod'yezd ...",
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
              ),
              SizedBox(height: 25,),

              // #to'liq ism sharifingiz
              Container(
                height: 55,
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.green),)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("To'liq ism sharifingiz", style: TextStyle(color: Colors.grey),),
                    SizedBox(height: 5,),
                    Text('Abdiyev Nasibali', style: TextStyle(fontSize: 18, color: Colors.black),),
                    SizedBox(height: 10,)
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),

              // #to'liq ism sharifingiz
              Container(
                height: 55,
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.green),)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Telefon nomeringiz", style: TextStyle(color: Colors.grey),),
                    SizedBox(height: 5,),
                    Text('+99899 876 54 32', style: TextStyle(fontSize: 18, color: Colors.black),),
                    SizedBox(height: 10,)
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),

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
                  child: Text('SAQLASH', style: TextStyle(fontSize: 18),),
                  onPressed: () {
                    // address manzilni to'liq jonatiladi
                    Navigator.pushReplacementNamed(context, AddressListPage.id);
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
