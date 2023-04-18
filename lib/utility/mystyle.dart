import 'package:flutter/material.dart';

import '../screens/showCart.dart';

class MyStyle {
  Color darkcolor = Colors.blue;
  Color primaryColor = Colors.green;

  Widget iconShowCart(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.shopping_cart_sharp),
      onPressed: () {
        MaterialPageRoute route = MaterialPageRoute(
          builder: (context) => ShowCart(),
        );
        Navigator.push(context, route);
      },
    );
  }

  SizedBox mySizebox() => SizedBox(
        width: 10,
        height: 10,
      );

  SizedBox mySizebox2() => SizedBox(
        width: 10,
        height: 50,
      );

  Widget showProgress() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  TextStyle mainTitle = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    color: Colors.purple,
  );

  TextStyle mainH2Title = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
    color: Colors.green.shade700,
  );

  Text showTitle(String title) => Text(
        title,
        style: TextStyle(
            fontSize: 24, color: Colors.blue, fontWeight: FontWeight.bold),
      );

  Text showTitle2(String title) => Text(
        title,
        style: TextStyle(
            fontSize: 16, color: Colors.blue, fontWeight: FontWeight.bold),
      );

  Container showlogo(String namePic) {
    return Container(
      width: 100,
      child: Image.asset(
        'images/$namePic',
        width: 120,
        height: 100,
      ),
    );
  }

  BoxDecoration myBoxDecoration(String namePic) {
    return BoxDecoration(
      image: DecorationImage(
        image: AssetImage('images/$namePic'),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget titleCenter(BuildContext context, String string) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 15,
        child: Text(
          string,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  MyStyle();
}
