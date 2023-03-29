import 'dart:developer';

import 'package:flutter/material.dart';

import '../utility/mystyle.dart';
import '../utility/signOut.dart';

class MainOwner extends StatefulWidget {
  const MainOwner({super.key});

  @override
  State<MainOwner> createState() => _MainOwnerState();
}

class _MainOwnerState extends State<MainOwner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PCRU FOOD'), actions: <Widget>[]),
      drawer: showDrawer(),
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
        // onTap: () {
        //   setState(() {
        //     currentWidget = OrderListShop();
        //   });
        //   Navigator.pop(context);
        // },
      );

  ListTile foodMenu() => ListTile(
        leading: Icon(Icons.fastfood),
        title: Text('รายการอาหาร'),
        subtitle: Text('รายการอาหาร ของร้าน'),
        // onTap: () {
        //   setState(() {
        //     currentWidget = ListFoodMenuShop();
        //   });
        //   Navigator.pop(context);
        // },
      );

  ListTile infomationMenu() => ListTile(
        leading: Icon(Icons.info),
        title: Text('รายละเอียด ของร้าน'),
        subtitle: Text('รายละเอียด ของร้าน พร้อม Edit'),
        // onTap: () {
        //   setState(() {
        //     currentWidget = InfomationShop();
        //   });
        //   Navigator.pop(context);
        // },
      );

  ListTile signOutMenu() => ListTile(
      leading: Icon(Icons.exit_to_app),
      title: Text('Sign Out'),
      subtitle: Text('Sign Out และ กลับไป หน้าแรก'),
      onTap: () => signOut());

  UserAccountsDrawerHeader showHead() {
    return UserAccountsDrawerHeader(
      currentAccountPicture: MyStyle().showlogo('logomarket.png'),
      accountName: Text('Name Shop'),
      accountEmail: Text('Login'),
    );
  }
}
