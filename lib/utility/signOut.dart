import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pcrufood/screens/homelogin.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> signOut() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.clear();
  exit(0);
  // MaterialPageRoute route = MaterialPageRoute(
  //   builder: (context) => Home(),
  // );
  // Navigator.pushAndRemoveUntil(context, route, (route) => false);
}
