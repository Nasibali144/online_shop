import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static final String id = 'home_page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSearch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Container(
          width: double.infinity,
          height: 32,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.grey)),
          child: TextField(
            onTap: () {
              setState(() {
                isSearch = !isSearch;
              });
            },
            decoration: InputDecoration(
                border: InputBorder.none,
                icon: Icon(Icons.search),
                hintText: 'Mahsulot qidirish',
                hintStyle: TextStyle(fontSize: 14.5)),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {},
          )
        ],
      ),
      drawer: Drawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // #reklama
            Container(
              height: 275,
              color: Colors.red,
            ),

            //kategoriyalar
            Container(
              height: 320,
              margin: EdgeInsets.only(bottom: 20),
              color: Colors.white,
              child: Column(
                children: [
                  SizedBox(height: 7.5,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    alignment: Alignment.center,
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Eng yaxshi takliflar', style: TextStyle(fontSize: 16),),
                        FlatButton(
                          height: 30,
                          color: Colors.green[50],
                          textColor: Colors.green,
                          onPressed: () {},
                          child: Text('Barchasi',),
                        )
                      ],
                    ),
                  ),
                  Divider(),
                  Expanded(child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      SizedBox(width: 10,),
                      Container(
                        margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                        width: 140,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          //mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: 155,
                              width: 140,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/product/product_1.png'),
                                )
                              ),
                              alignment: Alignment.topCenter,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 20,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.white, width: 2),
                                      color: Colors.red
                                    ),

                                  ),
                                  IconButton(icon: Icon(Icons.add_circle_outline_rounded, color: Colors.green, size: 32,), onPressed: () {}, padding: EdgeInsets.all(0),),
                                ],
                              ),
                            ),
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                Text('Price: 5000 ', style: TextStyle(color: Colors.green, fontSize: 16),),
                                Text("so'm", style: TextStyle(color: Colors.grey, fontSize: 14),)
                              ],
                            ),
                            SizedBox(height: 10,),
                            Text('Description: descr iption descri ption descri ption', style: TextStyle(fontWeight: FontWeight.w400),),
                          ],
                        ),
                      ),
                    ],
                  ),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
