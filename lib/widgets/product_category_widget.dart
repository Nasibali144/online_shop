import 'package:flutter/material.dart';
import 'package:online_shop/pages/product/product_list_page.dart';

class ProductCategoryWidget extends StatelessWidget {
  const ProductCategoryWidget({
    Key key,
    @required this.productCarts,
    @required this.categoryTheme,
  }) : super(key: key);

  final List<Widget> productCarts;
  final String categoryTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                Text(categoryTheme, style: TextStyle(fontSize: 16),),
                FlatButton(
                  height: 30,
                  color: Colors.green[50],
                  textColor: Colors.green,
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, ProductListPage.id);
                  },
                  child: Text('Barchasi',),
                )
              ],
            ),
          ),
          Divider(),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: productCarts.length,
              itemBuilder: (context, index) => productCarts[index],
            ),
          ),
        ],
      ),
    );
  }
}
