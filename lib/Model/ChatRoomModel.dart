
import 'package:hello/Model/ChatModel.dart';
import 'package:hello/Model/UserModel.dart';

class ChatRoomModel {
  String? id;
  UserModel? sender;
  UserModel? receiver;
  List<ChatModel>? message;
  int? unReadMessNo;
  String? lastMessage;
  String? lastMessageTimestamp;
  String? timestamp;

  ChatRoomModel({this.id, this.sender, this.receiver, this.message, this.unReadMessNo, this.lastMessage, this.lastMessageTimestamp, this.timestamp});

  ChatRoomModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    sender = json["sender"] == null ? null : UserModel.fromJson(json["sender"]);
    receiver = json["receiver"] == null ? null : UserModel.fromJson(json["receiver"]);
    message = json["message"] ?? [];
    unReadMessNo = json["unReadMessNo"];
    lastMessage = json["lastMessage"];
    lastMessageTimestamp = json["lastMessageTimestamp"];
    timestamp = json["timestamp"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    if(sender != null) {
      _data["sender"] = sender?.toJson();
    }
    if(receiver != null) {
      _data["receiver"] = receiver?.toJson();
    }
    if(message != null) {
      _data["message"] = message;
    }
    _data["unReadMessNo"] = unReadMessNo;
    _data["lastMessage"] = lastMessage;
    _data["lastMessageTimestamp"] = lastMessageTimestamp;
    _data["timestamp"] = timestamp;
    return _data;
  }
}