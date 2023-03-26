class UserModel {
  String? idUser;
  String? id;
  String? password;
  String? name;
  String? idcard;
  String? phonenumber;
  String? chooseType;

  UserModel(
      {this.idUser,
      this.id,
      this.password,
      this.name,
      this.idcard,
      this.phonenumber,
      this.chooseType});

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
    data['idUser'] = this.idUser;
    data['id'] = this.id;
    data['password'] = this.password;
    data['name'] = this.name;
    data['idcard'] = this.idcard;
    data['phonenumber'] = this.phonenumber;
    data['chooseType'] = this.chooseType;
    return data;
  }
}
