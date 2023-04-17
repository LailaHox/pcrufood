import 'package:flutter/material.dart';

import '../utility/mystyle.dart';
import '../utility/signOut.dart';

class MainRider extends StatefulWidget {
  const MainRider({super.key});

  @override
  State<MainRider> createState() => _MainRiderState();
}

class _MainRiderState extends State<MainRider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PCRU FOOD'),
      ),
      drawer: showDrawer(),
    );
  }

  Drawer showDrawer() => Drawer(
        child: ListView(
          children: <Widget>[showHead()],
        ),
      );

  UserAccountsDrawerHeader showHead() {
    return UserAccountsDrawerHeader(
      currentAccountPicture: MyStyle().showlogo('logorider.png'),
      accountName: Text('Name Rider'),
      accountEmail: Text('Login'),
    );
  }
}
