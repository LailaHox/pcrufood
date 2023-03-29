import 'package:flutter/material.dart';
import 'package:pcrufood/screens/homelogin.dart';
import 'package:pcrufood/screens/test.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple),
      title: 'PCRU FOOD',
      home: Home(),
    );
  }
}
