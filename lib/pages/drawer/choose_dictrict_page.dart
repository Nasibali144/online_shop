import 'package:flutter/material.dart';

class ChoseDistrict extends StatefulWidget {

  static final String id = "choose_dictrict_page";

  @override
  _ChoseDistrictState createState() => _ChoseDistrictState();
}

class _ChoseDistrictState extends State<ChoseDistrict> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Tumanni tanlang',
          style: TextStyle(color: Colors.black),
        ),
        leading: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(5),
              child: Text(
                'B',
                style: TextStyle(fontSize: 20),
              ),
            ),
            // SizedBox(
            //   height: 25,
            // ),
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Burxon',
                style: TextStyle(fontSize: 15),
              ),
              color: Colors.white,
              width: double.infinity,
            ),
            Divider(
              height: 2,
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Bomba',
                style: TextStyle(fontSize: 15),
              ),
              color: Colors.white,
              width: double.infinity,

              // padding: EdgeInsets.all(10),
              // child: Card(),
            ),
            Divider(
              height: 2,
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Buxoro',
                style: TextStyle(fontSize: 15),
              ),
              color: Colors.white,
              width: double.infinity,
            ),

            Container(
              padding: EdgeInsets.all(5),
              child: Text(
                'A',
                style: TextStyle(fontSize: 20),
              ),
            ),

            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Angren',
                style: TextStyle(fontSize: 15),
              ),
              color: Colors.white,
              width: double.infinity,
            ),
            Divider(
              height: 2,
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Dilshodjon Bunyodov cityxt',
                style: TextStyle(fontSize: 15),
              ),
              color: Colors.white,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}