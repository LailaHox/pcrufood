import 'package:flutter/material.dart';
import 'package:pcrufood/model/user_model.dart';

import '../utility/mystyle.dart';
import '../widget/aboutShop.dart';

class ShowShopFoodMenu extends StatefulWidget {
  const ShowShopFoodMenu({super.key, required UserModel userModel});

  @override
  State<ShowShopFoodMenu> createState() => _ShowShopFoodMenuState();
}

class _ShowShopFoodMenuState extends State<ShowShopFoodMenu> {
  UserModel? userModel;
  List<Widget> listWidgets = [];
  int indexPage = 0;

  @override
  void initState() {
    super.initState();
    userModel = userModel;
    // listWidgets.add(AboutShop(
    //   userModel: userModel!,
    // ));
    // listWidgets.add(ShowMenuFood(
    //   userModel: userModel,
    // ));
  }

  BottomNavigationBarItem aboutShopNav() {
    return BottomNavigationBarItem(
      icon: Icon(Icons.restaurant),
      // title: Text('รายละเอียดร้าน'),
    );
  }

  BottomNavigationBarItem showMenuFoodNav() {
    return BottomNavigationBarItem(
      icon: Icon(Icons.restaurant_menu),
      // title: Text('เมนูอาหาร'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[MyStyle().iconShowCart(context)],
        title: Text(userModel!.nameShop!),
      ),
      body: listWidgets.length == 0
          ? MyStyle().showProgress()
          : listWidgets[indexPage],
      bottomNavigationBar: showBottonNavigationBar(),
    );
  }

  BottomNavigationBar showBottonNavigationBar() => BottomNavigationBar(
        backgroundColor: Colors.orange,
        selectedItemColor: Colors.white,
        currentIndex: indexPage,
        onTap: (value) {
          setState(() {
            indexPage = value;
          });
        },
        items: <BottomNavigationBarItem>[
          aboutShopNav(),
          showMenuFoodNav(),
        ],
      );
}
