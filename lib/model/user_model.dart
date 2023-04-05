class UserModel {
  String? idUser;
  String? id;
  String? password;
  String? name;
  String? idcard;
  String? phonenumber;
  String? chooseType;
  String? nameShop;
  String? address;
  String? phoneShop;
  String? urlPicture;
  String? lat;
  String? lng;
  String? token;

  UserModel(
      {this.idUser,
      this.id,
      this.password,
      this.name,
      this.idcard,
      this.phonenumber,
      this.chooseType,
      this.nameShop,
      this.address,
      this.phoneShop,
      this.urlPicture,
      this.lat,
      this.lng,
      this.token});

  UserModel.fromJson(Map<String, dynamic> json) {
    idUser = json['idUser'];
    id = json['id'];
    password = json['password'];
    name = json['name'];
    idcard = json['idcard'];
    phonenumber = json['phonenumber'];
    chooseType = json['chooseType'];
    nameShop = json['NameShop'];
    address = json['Address'];
    phoneShop = json['PhoneShop'];
    urlPicture = json['UrlPicture'];
    lat = json['Lat'];
    lng = json['Lng'];
    token = json['Token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idUser'] = this.idUser;
    data['id'] = this.id;
    data['password'] = this.password;
    data['name'] = this.name;
    data['idcard'] = this.idcard;
    data['phonenumber'] = this.phonenumber;
    data['chooseType'] = this.chooseType;
    data['NameShop'] = this.nameShop;
    data['Address'] = this.address;
    data['PhoneShop'] = this.phoneShop;
    data['UrlPicture'] = this.urlPicture;
    data['Lat'] = this.lat;
    data['Lng'] = this.lng;
    data['Token'] = this.token;
    return data;
  }
}
