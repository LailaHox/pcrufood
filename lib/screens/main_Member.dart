import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utility/mystyle.dart';
import '../utility/signOut.dart';

class MainMember extends StatefulWidget {
  const MainMember({super.key});

  @override
  State<MainMember> createState() => _MainMemberState();
}

class _MainMemberState extends State<MainMember> {
  String? nameUser;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    findUser();
  }

  Future<void> findUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      nameUser = preferences.getString('name');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(nameUser == null ? 'Main Member' : '$nameUser '),
            actions: <Widget>[
              IconButton(
                  onPressed: () => signOut(),
                  icon: Icon(
                    Icons.exit_to_app_outlined,
                  ))
            ]),
        drawer: showDrawer());
  }

  Drawer showDrawer() => Drawer(
        child: ListView(
          children: <Widget>[showHead()],
        ),
      );

  UserAccountsDrawerHeader showHead() {
    return UserAccountsDrawerHeader(
      currentAccountPicture: MyStyle().showlogo('logomember.png'),
      accountName: Text('Name Member'),
      accountEmail: Text('Login'),
    );
  }
}
