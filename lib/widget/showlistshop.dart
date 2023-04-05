import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../model/user_model.dart';
import '../screens/showShopFoodMenu.dart';
import '../utility/myconstant.dart';
import '../utility/mystyle.dart';

class ShowListShop extends StatefulWidget {
  const ShowListShop({super.key});

  @override
  State<ShowListShop> createState() => _ShowListShopState();
}

class _ShowListShopState extends State<ShowListShop> {
  List<UserModel> userModels = [];
  List<Widget> shopCards = [];

  @override
  void initState() {
    super.initState();

    readShop();
  }

  Future<void> readShop() async {
    String url =
        '${MyConstant().domain}/foodapp/getIDWhereChooseType.php?isAdd=true&chooseType=Owner';
    await Dio().get(url).then((value) {
      // print('value = $value');
      var result = json.decode(value.data);
      int index = 0;
      for (var map in result) {
        UserModel model = UserModel.fromJson(map);
        // print('NameShop = ${model.nameShop}');
        String? nameShop = model.nameShop;
        if (nameShop!.isNotEmpty) {
          print('nameShop =${model.nameShop}');
          setState(() {
            userModels.add(model);
            userModels.add(model);
            shopCards.add(createCard(model, index));
            index++;
          });
        }
      }
    });
  }

  Widget createCard(UserModel userModel, int index) {
    return GestureDetector(
      onTap: () {
        print('You Click index $index');
        MaterialPageRoute route = MaterialPageRoute(
          builder: (context) => ShowShopFoodMenu(
            userModel: userModels[index],
          ),
        );
        Navigator.push(context, route);
      },
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 80.0,
              height: 80.0,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    '${MyConstant().domain}${userModel.urlPicture}'),
              ),
            ),
            MyStyle().mySizebox(),
            Container(
              width: 120,
              child: MyStyle().showTitle(userModel.nameShop!),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return shopCards.length == 0
        ? MyStyle().showProgress()
        : GridView.extent(
            maxCrossAxisExtent: 220.0,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            children: shopCards,
          );
  }
}
