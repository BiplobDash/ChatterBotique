import 'package:chatter_botique/model/chat_model.dart';
import 'package:chatter_botique/model/user_model.dart';

class ChatRoomModel {
  String? id;
  UserModel? sender;
  UserModel? receiver;
  List<ChatModel>? messages;
  int? unReadMessNo;
  String? lastMessage;
  String? lastMessageTimeStamp;
  String? timestamp;

  ChatRoomModel({
    this.id,
    this.sender,
    this.receiver,
    this.messages,
    this.unReadMessNo,
    this.lastMessage,
    this.lastMessageTimeStamp,
    this.timestamp,
  });

  ChatRoomModel.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["sender"] is Map) {
      sender =
          json["sender"] == null ? null : UserModel.fromJson(json["sender"]);
    }
    if (json["receiver"] is Map) {
      receiver = json["receiver"] == null
          ? null
          : UserModel.fromJson(json["receiver"]);
    }
    if (json["messages"] is List) {
      messages = json["messages"] ?? [];
    }
    if (json["unReadMessNo"] is int) {
      unReadMessNo = json["unReadMessNo"];
    }
    if (json["lastMessage"] is String) {
      lastMessage = json["lastMessage"];
    }
    if (json["lastMessageTimeStamp"] is String) {
      lastMessageTimeStamp = json["lastMessageTimeStamp"];
    }
    if (json["timestamp"] is String) {
      timestamp = json["timestamp"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    if (sender != null) {
      data["sender"] = sender?.toJson();
    }
    if (receiver != null) {
      data["receiver"] = receiver?.toJson();
    }
    if (messages != null) {
      data["messages"] = messages;
    }
    data["unReadMessNo"] = unReadMessNo;
    data["lastMessage"] = lastMessage;
    data["lastMessageTimeStamp"] = lastMessageTimeStamp;
    data["timestamp"] = timestamp;
    return data;
  }
}
