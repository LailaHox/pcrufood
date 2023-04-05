import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pcrufood/screens/addInfoOwner.dart';
import 'package:pcrufood/utility/mystyle.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/user_model.dart';
import '../screens/editInfoshop.dart';
import '../utility/myconstant.dart';

class Info extends StatefulWidget {
  const Info({super.key});

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  UserModel? userModel;
  @override
  void initState() {
    super.initState();
    readDataUser();
  }

  Future<void> readDataUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? idUser = preferences.getString('idUser');
    String url =
        '${MyConstant().domain}/foodapp/getIDWhereIdUser.php?isAdd=true&idUser=$idUser';
    await Dio().get(url).then((value) {
      // print('value ==>> $value');
      var result = json.decode(value.data);
      // print('result = $result');
      for (var map in result) {
        setState(() {
          userModel = UserModel.fromJson(map);
        });
        print('nameShop = ${userModel?.nameShop}');
      }
    });
  }

  void routeToAdddInfo() {
    Widget widget =
        userModel!.nameShop!.isEmpty ? addInfoOwner() : EditInfoShop();
    MaterialPageRoute materialPageRoute = MaterialPageRoute(
      builder: (context) => widget,
    );
    Navigator.push(context, materialPageRoute).then((value) => readDataUser());
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        userModel == null
            ? MyStyle().showProgress()
            : userModel!.nameShop!.isEmpty
                ? showNoData(context)
                : showListInfoShop(),
        addanEditButtoon(),
      ],
    );
  }

  Widget showListInfoShop() => Column(
        children: <Widget>[
          MyStyle().showTitle('รายละเอียดร้าน ${userModel?.nameShop}'),
          showImage(),
          MyStyle().mySizebox(),
          Row(
            children: <Widget>[
              MyStyle().showTitle('ที่อยู่ของร้าน'),
            ],
          ),
          Row(
            children: <Widget>[
              Text(userModel!.address!),
            ],
          ),
          MyStyle().mySizebox(),
          showMap(),
        ],
      );

  Container showImage() {
    return Container(
      width: 400.0,
      height: 300.0,
      child: Image.network('${MyConstant().domain}${userModel?.urlPicture}'),
    );
  }

  Widget showMap() {
    double lat = double.parse(userModel!.lat!);
    double lng = double.parse(userModel!.lng!);
    print('lat = $lat, lng = $lng');

    LatLng latLng = LatLng(lat, lng);
    CameraPosition position = CameraPosition(target: latLng, zoom: 16.0);

    return Expanded(
      child: GoogleMap(
        initialCameraPosition: position,
        mapType: MapType.normal,
        onMapCreated: (controller) {},
        markers: shopMarker(),
      ),
    );
  }

  Set<Marker> shopMarker() {
    return <Marker>[
      Marker(
          markerId: MarkerId('shopID'),
          position: LatLng(
            double.parse(userModel!.lat!),
            double.parse(userModel!.lng!),
          ),
          infoWindow: InfoWindow(
              title: 'ตำแหน่งร้าน',
              snippet:
                  'ละติจูต = ${userModel?.lat}, ลองติจูต = ${userModel?.lng}'))
    ].toSet();
  }

  Widget showNoData(BuildContext context) {
    return MyStyle()
        .titleCenter(context, '         ยังไม่มีข้อมูล กรุณาเพิ่มข้อมูล');
  }

  Row addanEditButtoon() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: EdgeInsets.only(right: 16, bottom: 16),
              child: FloatingActionButton(
                child: Icon(Icons.edit),
                onPressed: () {
                  print('move to addInfoOwner');
                  routeToAdddInfo();
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
