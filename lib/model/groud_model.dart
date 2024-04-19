import 'package:chatter_botique/model/user_model.dart';

class GroupModelUser {
  String? id;
  String? name;
  String? discription;
  String? profileUrl;
  List<UserModel>? members;
  String? createdAt;
  String? createdBy;
  String? status;
  String? lastMessage;
  String? lastMessageTime;
  String? lastMessageBy;
  int? unReadCount;
  String? timeStamp;

  GroupModelUser(
      {this.id,
      this.name,
      this.discription,
      this.profileUrl,
      this.members,
      this.createdAt,
      this.createdBy,
      this.status,
      this.lastMessage,
      this.lastMessageTime,
      this.lastMessageBy,
      this.unReadCount,
      this.timeStamp});

  GroupModelUser.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["discription"] is String) {
      discription = json["discription"];
    }
    if (json["profileUrl"] is String) {
      profileUrl = json["profileUrl"];
    }
    if (json["members"] != null) {
      members = List<UserModel>.from(
        json["members"].map(
          (memberJson) => UserModel.fromJson(memberJson),
        ),
      );
    } else {
      members = [];
    }
    if (json["createdAt"] is String) {
      createdAt = json["createdAt"];
    }
    if (json["createdBy"] is String) {
      createdBy = json["createdBy"];
    }
    if (json["status"] is String) {
      status = json["status"];
    }
    if (json["lastMessage"] is String) {
      lastMessage = json["lastMessage"];
    }
    if (json["lastMessageTime"] is String) {
      lastMessageTime = json["lastMessageTime"];
    }
    if (json["lastMessageBy"] is String) {
      lastMessageBy = json["lastMessageBy"];
    }
    if (json["unReadCount"] is int) {
      unReadCount = json["unReadCount"];
    }
    if (json["timeStamp"] is String) {
      timeStamp = json["timeStamp"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["discription"] = discription;
    data["profileUrl"] = profileUrl;
    if (members != null) {
      data["members"] = members;
    }
    data["createdAt"] = createdAt;
    data["createdBy"] = createdBy;
    data["status"] = status;
    data["lastMessage"] = lastMessage;
    data["lastMessageTime"] = lastMessageTime;
    data["lastMessageBy"] = lastMessageBy;
    data["unReadCount"] = unReadCount;
    data["timeStamp"] = timeStamp;
    return data;
  }
}
