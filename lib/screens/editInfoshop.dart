import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
import 'package:pcrufood/model/user_model.dart';
import 'package:pcrufood/utility/myconstant.dart';
import 'package:pcrufood/utility/mystyle.dart';
import 'package:pcrufood/utility/normalDialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pcrufood/screens/main_Owner.dart';

class EditInfoShop extends StatefulWidget {
  const EditInfoShop({super.key});

  @override
  State<EditInfoShop> createState() => _EditInfoShopState();
}

class _EditInfoShopState extends State<EditInfoShop> {
  UserModel? userModel;
  String? nameShop, address, phoneShop, urlPicture;
  Location location = Location();
  double? lat, lng;
  File? file;

  @override
  void initState() {
    super.initState();
    readCurrentInfo();

    location.onLocationChanged.listen((event) {
      setState(() {
        lat = event.latitude;
        lng = event.longitude;
        // print('lat=$lat,lng=$lng');
      });
    });
  }

  Future<void> readCurrentInfo() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? idShop = preferences.getString('idUser');
    print('idShop ==>> $idShop');

    String url =
        '${MyConstant().domain}/foodapp/getIDWhereIdUser.php?isAdd=true&idUser=$idShop';

    Response response = await Dio().get(url);
    print('response ==>> $response');

    var result = json.decode(response.data);
    print('result ==>> $result');

    for (var map in result) {
      print('map ==>> $map');
      setState(() {
        userModel = UserModel.fromJson(map);
        nameShop = userModel?.nameShop;
        address = userModel?.address;
        phoneShop = userModel?.phoneShop;
        urlPicture = userModel?.urlPicture;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: userModel == null ? MyStyle().showProgress() : showContent(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('แก้ไข รายละเอียดร้าน'),
      ),
    );
  }

  Widget showContent() => SingleChildScrollView(
        child: Column(
          children: <Widget>[
            showImage(),
            nameShopForm(),
            addressForm(),
            phoneForm(),
            lat == null ? MyStyle().showProgress() : showMap(),
            editButton()
          ],
        ),
      );

  Widget editButton() => Container(
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton.icon(
          onPressed: () => confirmDialog(),
          icon: Icon(
            Icons.edit,
            color: Colors.white,
          ),
          label: Text(
            'แก้ไข รายละเอียด',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );

  Future<void> confirmDialog() async {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: Text('คุณแน่ใจว่าจะ แก้ไขรายละเอียดร้าน ?'),
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              OutlinedButton(
                onPressed: () {
                  editThread();
                },
                child: Text('ตกลง'),
              ),
              OutlinedButton(
                onPressed: () => Navigator.pop(context),
                child: Text('ยกเลิก'),
              ),
            ],
          )
        ],
      ),
    );
  }

  Future<void> editThread() async {
    if (file != null) {
      String urlUpload = '${MyConstant().domain}/foodapp/saveshop.php';
      Random random = Random();
      int i = random.nextInt(1000000);
      String? nameFile = 'seeobj$i.jpg';
      Map<String, dynamic> map = Map();
      map['file'] =
          await MultipartFile.fromFile(file!.path, filename: nameFile);
      FormData formData = FormData.fromMap(map);
      await Dio().post(urlUpload, data: formData);
      String urlPathImage = '$nameFile';
      // print('urlPathImage = /foodapp/Shop/$nameFile');
      String? idUser = userModel!.idUser;
      String url =
          '${MyConstant().domain}/foodapp/editUserWhereIdUser.php?isAdd=true&idUser=$idUser&NameShop=$nameShop&Address=$address&PhoneShop=$phoneShop&UrlPicture=$urlPicture&Lat=$lat&Lng=$lng';
      await Dio().get(url).then((value) {
        if (value.toString() == 'true') {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) => MainOwner()),
          );
        }
      });
    } else {
      String? idUser = userModel!.idUser;
      String url =
          '${MyConstant().domain}/foodapp/editUserWhereIdUser.php?isAdd=true&idUser=$idUser&NameShop=$nameShop&Address=$address&PhoneShop=$phoneShop&UrlPicture=$urlPicture&Lat=$lat&Lng=$lng';
      await Dio().get(url).then((value) {
        if (value.toString() == 'true') {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) => MainOwner()),
          );
        } else {
          // normalDialog(context, 'กรุณาลองใหม่ มีอะไร ? ผิดพลาด');
        }
      });
    }
  }

  // Future<void> editThread() async {
  //   Random random = Random();
  //   int i = random.nextInt(100000);
  //   String nameFile = 'editShop$i.jpg';

  //   Map<String, dynamic> map = Map();
  //   map['file'] = await MultipartFile.fromFile(file!.path, filename: nameFile);
  //   FormData formData = FormData.fromMap(map);

  //   String urlUpload = '${MyConstant().domain}/foodapp/saveshop.php';
  //   await Dio().post(urlUpload, data: formData).then((value) async {
  //     urlPicture = '/foodapp/Shop/$nameFile';

  //     String idUser = userModel!.idUser!;
  //     // print('idUser = $idUser');

  //     String url =
  //         '${MyConstant().domain}/foodapp/editUserWhereIdUser.php?isAdd=true&idUser=$idUser&NameShop=$nameShop&Address=$address&PhoneShop=$phoneShop&UrlPicture=$urlPicture&Lat=$lat&Lng=$lng';

  //     Response response = await Dio().get(url);
  //     if (response.toString() == 'true') {
  //       Navigator.push;
  //     } else {
  //       normalDialog(context, 'แก้ไขไม่ได้ กรุณาลองใหม่');
  //     }
  //   });
  // }

  Set<Marker> currentMarker() {
    return <Marker>[
      Marker(
          markerId: MarkerId('myMarker'),
          position: LatLng(lat!, lng!),
          infoWindow: InfoWindow(
              title: 'ร้านอยู่ที่นี่', snippet: 'Lat = $lat, Lng = $lng'))
    ].toSet();
  }

  Container showMap() {
    CameraPosition cameraPosition = CameraPosition(
      target: LatLng(lat!, lng!),
      zoom: 16.0,
    );

    return Container(
      margin: EdgeInsets.only(top: 16.0),
      height: 250,
      child: GoogleMap(
        initialCameraPosition: cameraPosition,
        mapType: MapType.normal,
        onMapCreated: (controller) {},
        markers: currentMarker(),
      ),
    );
  }

  Future<void> chooseImage(ImageSource source) async {
    try {
      var object = await ImagePicker().pickImage(
        source: source,
        maxWidth: 800.0,
        maxHeight: 800.0,
      );

      setState(() {
        file = File(object!.path);
      });
    } catch (e) {}
  }

  Widget showImage() => Container(
        margin: EdgeInsetsDirectional.only(top: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.add_a_photo),
              onPressed: () => chooseImage(ImageSource.camera),
            ),
            Container(
              width: 250.0,
              height: 250.0,
              child: file == null
                  ? Image.network('${MyConstant().domain}$urlPicture')
                  : Image.file(file!),
            ),
            IconButton(
              icon: Icon(Icons.add_photo_alternate),
              onPressed: () => chooseImage(ImageSource.gallery),
            ),
          ],
        ),
      );

  Widget nameShopForm() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 16.0),
            width: 250.0,
            child: TextFormField(
              onChanged: (value) => nameShop = value,
              initialValue: nameShop,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'ชื่อของร้าน',
              ),
            ),
          ),
        ],
      );

  Widget addressForm() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 16.0),
            width: 250.0,
            child: TextFormField(
              onChanged: (value) => address = value,
              initialValue: address,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'ที่อยู่ของร้าน',
              ),
            ),
          ),
        ],
      );

  Widget phoneForm() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 16.0),
            width: 250.0,
            child: TextFormField(
              onChanged: (value) => phoneShop = value,
              initialValue: phoneShop,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'เบอร์ติดต่อร้าน',
              ),
            ),
          ),
        ],
      );
}
