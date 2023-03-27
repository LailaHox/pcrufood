class UserModel {
  String? idUser;
  String? id;
  String? password;
  String? name;
  String? idcard;
  String? phonenumber;
  String? chooseType;

  UserModel(
      {required this.idUser,
      required this.id,
      required this.password,
      required this.name,
      required this.idcard,
      required this.phonenumber,
      required this.chooseType});

  UserModel.fromJson(Map<String, dynamic> json) {
    idUser = json['idUser'];
    id = json['id'];
    password = json['password'];
    name = json['name'];
    idcard = json['idcard'];
    phonenumber = json['phonenumber'];
    chooseType = json['chooseType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idUser'] = idUser;
    data['id'] = id;
    data['password'] = password;
    data['name'] = name;
    data['idcard'] = idcard;
    data['phonenumber'] = phonenumber;
    data['chooseType'] = chooseType;
    return data;
  }
}
