import 'package:flutter/material.dart';
import 'package:pcrufood/utility/checknull.dart';
import 'package:pcrufood/utility/mystyle.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String? chooseType;
  String? id, password, name, idcard, phonenumber;

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
          textName(),
          MyStyle().mySizebox(),
          textIDcard(),
          MyStyle().mySizebox(),
          textPhone(),
          MyStyle().mySizebox(),
          memberRadio(),
          MyStyle().mySizebox(),
          ownerRadio(),
          MyStyle().mySizebox(),
          riderRadio(),
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
          obscureText: true,
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

  Widget textName() => Container(
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

  Widget textIDcard() => Container(
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

  Widget textPhone() => Container(
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

  Widget memberRadio() => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: 230,
            child: Row(
              children: <Widget>[
                Radio(
                    value: 'Member',
                    groupValue: chooseType,
                    onChanged: (value) => setState(
                          () {
                            chooseType = value;
                          },
                        )),
                Text(
                  'สมาชิก',
                  style: TextStyle(color: MyStyle().darkcolor),
                )
              ],
            ),
          ),
        ],
      );

  Widget ownerRadio() => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: 230,
            child: Row(
              children: <Widget>[
                Radio(
                    value: 'Owner',
                    groupValue: chooseType,
                    onChanged: (value) => setState(
                          () {
                            chooseType = value;
                          },
                        )),
                Text(
                  'เจ้าของร้านค้า',
                  style: TextStyle(color: MyStyle().darkcolor),
                )
              ],
            ),
          ),
        ],
      );

  Widget riderRadio() => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: 230,
            child: Row(
              children: <Widget>[
                Radio(
                    value: 'Rider',
                    groupValue: chooseType,
                    onChanged: (value) => setState(
                          () {
                            chooseType = value;
                          },
                        )),
                Text(
                  'คนส่งอาหาร',
                  style: TextStyle(color: MyStyle().darkcolor),
                )
              ],
            ),
          ),
        ],
      );

  Widget regisButton() => Container(
        width: 250,
        height: 40,
        child: ElevatedButton(
          onPressed: () {
            print(
                'id =$id,password=$password,name=$name,idcard=$idcard,phonenumber=$phonenumber,chooseType = $chooseType');
            if (id == null ||
                id!.isEmpty ||
                password == null ||
                password!.isEmpty ||
                name == null ||
                name!.isEmpty ||
                idcard == null ||
                idcard!.isEmpty ||
                phonenumber == null ||
                phonenumber!.isEmpty) {
              print('คุณกรอกข้อมูลไม่ครบถ้วน');
              checknull(context, 'คุณกรอกข้อมูลไม่ครบถ้วน');
            } else if (chooseType == null) {
              checknull(context, 'กรุณาเลือกประเภทของผู้สมัคร');
            } else {}
          },
          child: Text('Register'),
        ),
      );
}
