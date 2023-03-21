import 'package:flutter/material.dart';
import 'package:pcrufood/utility/mystyle.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
              MyStyle().showlogoaccount(),
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
          onPressed: () {},
          child: Text('Login'),
        ),
      );

  Widget idForm() => Container(
        width: 250,
        child: TextField(
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
