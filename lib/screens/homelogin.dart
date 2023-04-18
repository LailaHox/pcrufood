import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:pcrufood/screens/main_Member.dart';
import 'package:pcrufood/screens/main_Owner.dart';
import 'package:pcrufood/screens/main_Rider.dart';
import 'package:pcrufood/screens/signIn.dart';
import 'package:pcrufood/screens/signUp.dart';
import 'package:pcrufood/utility/normalDialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkPreference();
  }

  Future<void> checkPreference() async {
    try {
      // FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
      // String? token = await firebaseMessaging.getToken();
      // print('token ====>>> $token');

      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? choosType = preferences.getString('chooseType');
      if (choosType != null && choosType.isNotEmpty) {
        if (choosType == 'Member') {
          routeToService(MainMember());
        } else if (choosType == 'Owner') {
          routeToService(MainOwner());
        } else if (choosType == 'Rider') {
          routeToService(MainRider());
        } else {
          normalDialog(context, 'ERROR Type');
        }
      }
    } catch (e) {}
  }

  void routeToService(Widget myWidget) {
    MaterialPageRoute route = MaterialPageRoute(
      builder: (context) => MainMember(),
    );
    Navigator.pushAndRemoveUntil(context, route, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: showdrawer(),
    );
  }

  Drawer showdrawer() => Drawer(
        child: ListView(
          children: <Widget>[showHeadDrawer(), signInMenu(), signUpMenu()],
        ),
      );

  ListTile signInMenu() {
    return ListTile(
      leading: Icon(Icons.android),
      title: Text('Sign In'),
      onTap: () {
        Navigator.pop(context);
        MaterialPageRoute route =
            MaterialPageRoute(builder: (value) => SignIn());
        Navigator.push(context, route);
      },
    );
  }

  ListTile signUpMenu() {
    return ListTile(
      leading: Icon(Icons.android),
      title: Text('Sign Up'),
      onTap: () {
        Navigator.pop(context);
        MaterialPageRoute route =
            MaterialPageRoute(builder: (value) => SignUp());
        Navigator.push(context, route);
      },
    );
  }

  UserAccountsDrawerHeader showHeadDrawer() {
    return UserAccountsDrawerHeader(
        accountName: Text('Guest'), accountEmail: Text('Please Login'));
  }
}
