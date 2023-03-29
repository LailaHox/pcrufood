import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pcrufood/model/user_model.dart';
import 'package:pcrufood/screens/main_Member.dart';
import 'package:pcrufood/screens/main_Owner.dart';
import 'package:pcrufood/screens/main_Rider.dart';
import 'package:pcrufood/utility/mystyle.dart';
import 'package:pcrufood/utility/normalDialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String? id, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('เข้าสู่ระบบ'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              MyStyle().showlogo('logoaccount.png'),
              MyStyle().mySizebox(),
              MyStyle().showTitle('PCRU FOOD'),
              MyStyle().mySizebox(),
              idForm(),
              MyStyle().mySizebox(),
              passwordForm(),
              MyStyle().mySizebox(),
              loginButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget loginButton() => Container(
        width: 250,
        height: 30,
        child: ElevatedButton(
          onPressed: () {
            if (id == null ||
                id!.isEmpty ||
                password == null ||
                password!.isEmpty) {
              normalDialog(context, 'คุณกรอกข้อมูลไม่ครบถ้วน');
            } else {
              checkAuthen();
            }
          },
          child: Text('Login'),
        ),
      );

  Future<void> checkAuthen() async {
    String url =
        'http://192.168.1.49/test/getIDWhereUser.php?isAdd=true&id=$id';
    try {
      Response response = await Dio().get(url);
      print('res = $response');

      var result = json.decode(response.data);
      print('result = $result');
      for (var map in result) {
        UserModel userModel = UserModel.fromJson(map);
        if (password == userModel.password) {
          String? chooseType = userModel.chooseType;
          if (chooseType == 'Member') {
            routeToService(MainMember(), userModel);
          } else if (chooseType == 'Owner') {
            routeToService(MainOwner(), userModel);
          } else if (chooseType == 'Rider') {
            routeToService(MainRider(), userModel);
            // function myfunction(method,method)
          } else {
            normalDialog(context, 'ERROR');
          }
        } else {
          normalDialog(context, 'Password ผิด');
        }
      }
    } catch (e) {
      print(e);
    }
  }

  // function myfunction(param,param)
  Future<void> routeToService(myWidget, userModel) async {
    // Future<void> routeToService(Widget myWidget, UserModel userModel) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('id', userModel.id);
    preferences.setString('name', userModel.name);
    preferences.setString('chooseType', userModel.chooseType);
    MaterialPageRoute route = MaterialPageRoute(
      builder: (context) => myWidget,
    );
    Navigator.pushAndRemoveUntil(context, route, (Route) => false);
  }

  Widget idForm() => Container(
        width: 250,
        child: TextField(
          onChanged: (value) => id = value.trim(),
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.account_box,
              color: MyStyle().darkcolor,
            ),
            labelStyle: TextStyle(color: MyStyle().darkcolor),
            labelText: 'ID',
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MyStyle().darkcolor),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MyStyle().primaryColor),
            ),
          ),
        ),
      );

  Widget passwordForm() => Container(
        width: 250,
        child: TextField(
          onChanged: (value) => password = value.trim(),
          obscureText: true,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.lock,
              color: MyStyle().darkcolor,
            ),
            labelStyle: TextStyle(color: MyStyle().darkcolor),
            labelText: 'Password',
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MyStyle().darkcolor),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MyStyle().primaryColor),
            ),
          ),
        ),
      );
}
