import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:pcrufood/utility/checknull.dart';
import 'package:pcrufood/utility/mystyle.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var id, password, name, idcard, phonenumber;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: ListView(
        padding: EdgeInsets.all(50),
        children: <Widget>[
          myLogo(),
          MyStyle().mySizebox(),
          myLogoName(),
          MyStyle().mySizebox(),
          idFormRegis(),
          MyStyle().mySizebox(),
          passwordRegis(),
          MyStyle().mySizebox(),
          ownerName(),
          MyStyle().mySizebox(),
          ownerIDcard(),
          MyStyle().mySizebox(),
          ownerPhone(),
          MyStyle().mySizebox(),
          regisButton(),
          MyStyle().mySizebox(),
        ],
      ),
    );
  }

  Row myLogoName() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MyStyle().showTitle('PCRU FOOD'),
      ],
    );
  }

  Widget myLogo() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          MyStyle().showlogoaccount(),
        ],
      );

  Widget idFormRegis() => Container(
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

  Widget passwordRegis() => Container(
        width: 250,
        child: TextField(
          onChanged: (value) => password = value.trim(),
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

  Widget ownerName() => Container(
        width: 250,
        child: TextField(
          onChanged: (value) => name = value.trim(),
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.face,
              color: MyStyle().darkcolor,
            ),
            labelStyle: TextStyle(color: MyStyle().darkcolor),
            labelText: 'Name',
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MyStyle().darkcolor),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MyStyle().primaryColor),
            ),
          ),
        ),
      );

  Widget ownerIDcard() => Container(
        width: 250,
        child: TextField(
          onChanged: (value) => idcard = value.trim(),
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.padding,
              color: MyStyle().darkcolor,
            ),
            labelStyle: TextStyle(color: MyStyle().darkcolor),
            labelText: 'ID CARD',
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MyStyle().darkcolor),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MyStyle().primaryColor),
            ),
          ),
        ),
      );

  Widget ownerPhone() => Container(
        width: 250,
        child: TextField(
          onChanged: (value) => phonenumber = value.trim(),
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.phone,
              color: MyStyle().darkcolor,
            ),
            labelStyle: TextStyle(color: MyStyle().darkcolor),
            labelText: 'Phone Number',
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MyStyle().darkcolor),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MyStyle().primaryColor),
            ),
          ),
        ),
      );

  Widget regisButton() => Container(
        width: 250,
        height: 40,
        child: ElevatedButton(
          onPressed: () {
            print(
                'id =$id,password=$password,name=$name,idcard=$idcard,phonenumber=$phonenumber');
            if (id == null ||
                id.isEmpty ||
                password == null ||
                password.isEmpty ||
                name == null ||
                name.isEmpty ||
                idcard == null ||
                idcard.isEmpty ||
                phonenumber == null ||
                phonenumber.isEmpty) {
              print('คุณกรอกข้อมูลไม่ครบถ้วน');
              checknull(context, 'คุณกรอกข้อมูลไม่ครบถ้วน');
            }
          },
          child: Text('Register'),
        ),
      );
}
