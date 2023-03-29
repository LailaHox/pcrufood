import 'package:flutter/material.dart';

class MyStyle {
  Color darkcolor = Colors.blue;
  Color primaryColor = Colors.green;

  SizedBox mySizebox() => SizedBox(
        width: 10,
        height: 10,
      );

  Text showTitle(String title) => Text(
        title,
        style: TextStyle(
            fontSize: 24, color: Colors.blue, fontWeight: FontWeight.bold),
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

  MyStyle();
}
