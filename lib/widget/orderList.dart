import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/order_model.dart';
import '../utility/myAPI.dart';
import '../utility/myconstant.dart';
import '../utility/mystyle.dart';

class OrderList extends StatefulWidget {
  const OrderList({super.key});

  @override
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  String? idShop;
  List<OrderModel> orderModels = [];
  List<List<String>> listNameFoods = [];
  List<List<String>> listPrices = [];
  List<List<String>> listAmounts = [];
  List<List<String>> listSums = [];
  List<int> totals = [];

  @override
  void initState() {
    super.initState();
    findIdShopAndReadOrder();
  }

  Future<void> findIdShopAndReadOrder() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    idShop = preferences.getString(MyConstant().keyId);
    print('idShop = $idShop');

    String path =
        '${MyConstant().domain}/foodapp/getOrderWhereIdShop.php?isAdd=true&idShop=$idShop';
    await Dio().get(path).then((value) {
      // print('value ==>> $value');
      var result = json.decode(value.data);
      // print('result ==>> $result');
      for (var item in result) {
        OrderModel model = OrderModel.fromJson(item);
        // print('orderDateTime = ${model.orderDateTime}');

        List<String> nameFoods = MyAPI().createStringArray(model.nameFood!);
        List<String> prices = MyAPI().createStringArray(model.price!);
        List<String> amounts = MyAPI().createStringArray(model.amount!);
        List<String> sums = MyAPI().createStringArray(model.sum!);

        int total = 0;
        for (var item in sums) {
          total = total + int.parse(item);
        }

        setState(() {
          orderModels.add(model);
          listNameFoods.add(nameFoods);
          listPrices.add(prices);
          listAmounts.add(amounts);
          listSums.add(sums);
          totals.add(total);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: orderModels.length == 0
          ? MyStyle().showProgress()
          : ListView.builder(
              itemCount: orderModels.length,
              itemBuilder: (context, index) => Card(
                color: index % 2 == 0
                    ? Colors.lime.shade100
                    : Colors.lime.shade400,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyStyle().showTitle(orderModels[index].nameUser!),
                      MyStyle().showTitle(orderModels[index].orderDateTime!),
                      buildTitle(),
                      ListView.builder(
                        itemCount: listNameFoods[index].length,
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemBuilder: (context, index2) => Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Text(listNameFoods[index][index2]),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(listPrices[index][index2]),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(listAmounts[index][index2]),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(listSums[index][index2]),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 6,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                MyStyle().showTitle('Total :'),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child:
                                MyStyle().showTitle(totals[index].toString()),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton.icon(
                              onPressed: () {},
                              icon: Icon(
                                Icons.cancel,
                                color: Colors.white,
                              ),
                              label: Text(
                                'Cancel',
                                style: TextStyle(color: Colors.white),
                              )),
                          ElevatedButton.icon(
                              onPressed: () {},
                              icon: Icon(
                                Icons.restaurant,
                                color: Colors.white,
                              ),
                              label: Text(
                                'Cooking',
                                style: TextStyle(color: Colors.white),
                              )),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Container buildTitle() {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(color: Colors.lime.shade700),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text('Name Food'),
          ),
          Expanded(
            flex: 1,
            child: Text('Price'),
          ),
          Expanded(
            flex: 1,
            child: Text('Amount'),
          ),
          Expanded(
            flex: 1,
            child: Text('Sum'),
          ),
        ],
      ),
    );
  }
}
