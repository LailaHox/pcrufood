import 'package:flutter/material.dart';

class MyStyle {
  Color darkcolor = Colors.blue;
  Color primaryColor = Colors.green;

  SizedBox mySizebox() => SizedBox(
        width: 10,
        height: 15,
      );

  Text showTitle(String title) => Text(
        title,
        style: TextStyle(
            fontSize: 24, color: Colors.blue, fontWeight: FontWeight.bold),
      );

  Container showlogoaccount() {
    return Container(
      width: 100,
      child: Image.asset(
        'images/logoaccount.png',
        width: 120,
        height: 100,
      ),
    );
  }

  MyStyle();
}
