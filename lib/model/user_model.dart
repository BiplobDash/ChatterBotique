
class UserModel {
  String? id;
  String? name;
  String? email;
  String? phoneNumber;
  String? profileImage;

  UserModel({this.id, this.name, this.email, this.phoneNumber, this.profileImage});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    email = json["email"];
    phoneNumber = json["phoneNumber"];
    profileImage = json["profileImage"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["email"] = email;
    data["phoneNumber"] = phoneNumber;
    data["profileImage"] = profileImage;
    return data;
  }
}