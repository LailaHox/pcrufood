import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:steps_indicator/steps_indicator.dart';

import '../model/order_model.dart';
import '../utility/myconstant.dart';
import '../utility/mystyle.dart';

class ShowStatusOrder extends StatefulWidget {
  const ShowStatusOrder({super.key});

  @override
  State<ShowStatusOrder> createState() => _ShowStatusOrderState();
}

class _ShowStatusOrderState extends State<ShowStatusOrder> {
  String? idMem;
  bool statusOrder = true;
  List<OrderModel> orderModels = [];
  List<List<String>> listMenuFoods = [];
  List<List<String>> listPrices = [];
  List<List<String>> listAmounts = [];
  List<List<String>> listSums = [];
  List<int> totalInts = [];
  List<int> statusInts = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    findUser();
  }

  @override
  Widget build(BuildContext context) {
    return statusOrder ? buildNonOrder() : buildContent();
  }

  Widget buildContent() => ListView.builder(
        padding: EdgeInsets.all(16),
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: orderModels.length,
        itemBuilder: (context, index) => Column(
          children: [
            MyStyle().mySizebox(),
            buildNameShop(index),
            buildDatatimeOrder(index),
            buildDistance(index),
            buildTransport(index),
            buildHead(),
            buildListViewMenuFood(index),
            buildTotal(index),
            MyStyle().mySizebox(),
            buildStepIndicator(statusInts[index]),
            MyStyle().mySizebox(),
          ],
        ),
      );

  Widget buildStepIndicator(int index) => Column(
        children: [
          StepsIndicator(
            lineLength: 80,
            selectedStep: index,
            nbSteps: 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('Order'),
              Text('Cooking'),
              Text('Delivery'),
              Text('Finish'),
            ],
          ),
        ],
      );

  Widget buildTotal(int index) => Row(
        children: [
          Expanded(
            flex: 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyStyle().showTitle('รวมราคาอาหาร '),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyStyle().showTitle(totalInts[index].toString()),
              ],
            ),
          ),
        ],
      );

  ListView buildListViewMenuFood(int index) => ListView.builder(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: listMenuFoods[index].length,
        itemBuilder: (context, index2) => Row(
          children: [
            Expanded(
              flex: 3,
              child: Text(listMenuFoods[index][index2]),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(listPrices[index][index2]),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(listAmounts[index][index2]),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(listSums[index][index2]),
                ],
              ),
            ),
          ],
        ),
      );

  Container buildHead() {
    return Container(
      padding: EdgeInsets.only(left: 8),
      decoration: BoxDecoration(color: Colors.grey),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: MyStyle().showTitle('รายการอาหาร'),
          ),
          Expanded(
            flex: 1,
            child: MyStyle().showTitle('ราคา'),
          ),
          Expanded(
            flex: 1,
            child: MyStyle().showTitle('จำนวน'),
          ),
          Expanded(
            flex: 1,
            child: MyStyle().showTitle('ผลรวม'),
          ),
        ],
      ),
    );
  }

  Row buildTransport(int index) {
    return Row(
      children: [
        MyStyle().showTitle('ค่าขนส่ง ${orderModels[index].transport} บาท'),
      ],
    );
  }

  Row buildDistance(int index) {
    return Row(
      children: [
        MyStyle().showTitle('ระยะทาง ${orderModels[index].distance} กิโลเมตร'),
      ],
    );
  }

  Row buildDatatimeOrder(int index) {
    return Row(
      children: [
        MyStyle()
            .showTitle('วันเวลาที่ Order ${orderModels[index].orderDateTime}'),
      ],
    );
  }

  Row buildNameShop(int index) {
    return Row(
      children: [
        MyStyle().showTitle('ร้าน ${orderModels[index].nameShop}'),
      ],
    );
  }

  Center buildNonOrder() =>
      Center(child: Text('ยังไม่เคยมี ข้อมูลการสั่งอาหาร'));

  Future<void> findUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    idMem = preferences.getString('idUser');
    // print('idUser = $idUser');
    readOrderFromIdUser();
  }

  Future<void> readOrderFromIdUser() async {
    if (idMem != null) {
      String url =
          '${MyConstant().domain}/foodapp/getOrderWhereIdMem.php?isAdd=true&idMem=$idMem';

      Response response = await Dio().get(url);
      // print('respose ######==> $response');
      if (response.toString() != 'null') {
        var result = json.decode(response.data);
        for (var map in result) {
          OrderModel model = OrderModel.fromJson(map);
          List<String> menuFoods = changeArrey(model.nameFood!);
          List<String> prices = changeArrey(model.price!);
          List<String> amounts = changeArrey(model.amount!);
          List<String> sums = changeArrey(model.sum!);
          // print('menuFoods ==>> $menuFoods');

          int status = 0;
          switch (model.status) {
            case 'UserOrder':
              status = 0;
              break;
            case 'ShopCooking':
              status = 1;
              break;
            case 'RiderHandle':
              status = 2;
              break;
            case 'Finish':
              status = 3;
              break;
            default:
          }

          int total = 0;
          for (var string in sums) {
            total = total + int.parse(string.trim());
          }

          print('total = $total');

          setState(() {
            statusOrder = false;
            orderModels.add(model);

            listMenuFoods.add(menuFoods);
            listPrices.add(prices);
            listAmounts.add(amounts);
            listSums.add(sums);

            totalInts.add(total);
            statusInts.add(status);
          });
        }
      }
    }
  }

  List<String> changeArrey(String string) {
    List<String> list = [];
    String myString = string.substring(1, string.length - 1);
    // print('myString = $myString');
    list = myString.split(',');
    int index = 0;
    for (var string in list) {
      list[index] = string.trim();
      index++;
    }
    // print('list *****=>> $list');
    return list;
  }
}
