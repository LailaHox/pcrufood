import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:pcrufood/widget/infoOwner.dart';
import 'package:pcrufood/widget/menu.dart';
import 'package:pcrufood/widget/orderList.dart';

import '../utility/mystyle.dart';
import '../utility/normalDialog.dart';
import '../utility/signOut.dart';

class MainOwner extends StatefulWidget {
  const MainOwner({super.key});

  @override
  State<MainOwner> createState() => _MainOwnerState();
}

class _MainOwnerState extends State<MainOwner> {
  Widget currentWidget = OrderList();

  @override
  void initState() {
    super.initState();
    // aboutNotification();
  }

  // Future<void> aboutNotification() async {
  //   if (Platform.isAndroid) {
  //     print('aboutNoti Work Android');

  //     FirebaseMessaging firebaseMessaging = FirebaseMessaging();
  //     await firebaseMessaging.configure(
  //       onLaunch: (message) async {
  //         print('Noti onLaunch');
  //       },
  //       onResume: (message) async {
  //         String title = message['data']['title'];
  //         String body = message['data']['body'];
  //         print('Noti onResume ${message.toString()}');
  //         print('title = $title, body = $body');
  //         normalDialog(context, title, body);
  //       },
  //       onMessage: (message) async {
  //         print('Noti onMessage ${message.toString()}');
  //         String title = message['notification']['title'];
  //         String notiMessage = message['notification']['body'];
  //         normalDialog(context, title, notiMessage);
  //       },
  //     );
  //   } else if (Platform.isIOS) {
  //     print('aboutNoti Work iOS');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PCRU FOOD'),
      ),
      drawer: showDrawer(),
      body: currentWidget,
    );
  }

  Drawer showDrawer() => Drawer(
        child: ListView(
          children: <Widget>[
            showHead(),
            homeMenu(),
            foodMenu(),
            infomationMenu(),
            signOutMenu(),
          ],
        ),
      );
  ListTile homeMenu() => ListTile(
        leading: Icon(Icons.home),
        title: Text('รายการอาหารที่ ลูกค้าสั่ง'),
        subtitle: Text('รายการอาหารที่ยังไม่ได้ ทำส่งลูกค้า'),
        onTap: () {
          setState(() {
            currentWidget = OrderList();
          });
          Navigator.pop(context);
        },
      );

  ListTile foodMenu() => ListTile(
        leading: Icon(Icons.fastfood),
        title: Text('รายการอาหาร'),
        subtitle: Text('รายการอาหาร ของร้าน'),
        onTap: () {
          setState(() {
            currentWidget = Menu();
          });
          Navigator.pop(context);
        },
      );

  ListTile infomationMenu() => ListTile(
        leading: Icon(Icons.info),
        title: Text('รายละเอียด ของร้าน'),
        subtitle: Text('รายละเอียด ของร้าน พร้อม Edit'),
        onTap: () {
          setState(() {
            currentWidget = Info();
          });
          Navigator.pop(context);
        },
      );

  ListTile signOutMenu() => ListTile(
      leading: Icon(Icons.exit_to_app),
      title: Text('Sign Out'),
      subtitle: Text('Sign Out และ กลับไป หน้าแรก'),
      onTap: () => signOut(context));

  UserAccountsDrawerHeader showHead() {
    return UserAccountsDrawerHeader(
      currentAccountPicture: MyStyle().showlogo('logomarket.png'),
      accountName: Text('Name Shop'),
      accountEmail: Text('Login'),
    );
  }
}
