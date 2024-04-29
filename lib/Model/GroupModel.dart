import 'package:hello/Model/UserModel.dart';

class GroupModel {
  String? id;
  String? nmae;
  String? description;
  String? profileUrl;
  List<UserModel>? members;
  String? cretedAt;
  String? cretedBy;
  String? status;
  String? lastMessage;
  String? lastMessageTime;
  String? lastMessageBy;
  int? unReadCount;
  String? timeStamp;

  GroupModel({
    this.id,
    this.nmae,
    this.description,
    this.profileUrl,
    this.members,
    this.cretedAt,
    this.cretedBy,
    this.status,
    this.lastMessage,
    this.lastMessageTime,
    this.lastMessageBy,
    this.unReadCount,
    this.timeStamp,
  });

  GroupModel.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["nmae"] is String) {
      nmae = json["nmae"];
    }
    if (json["description"] is String) {
      description = json["description"];
    }
    if (json["profileUrl"] is String) {
      profileUrl = json["profileUrl"];
    }
    // if (json["members"] is Map) {
    //   json["members"] == null ? null : UserModel.fromJson(json["members"]);
    // }
    if (json["members"] != null) {
      members = List<UserModel>.from(
        json["members"].map((memberJson) => UserModel.fromJson(memberJson)),
      );
    } else {
      members = [];
    }
    if (json["cretedAt"] is String) {
      cretedAt = json["cretedAt"];
    }
    if (json["cretedBy"] is String) {
      cretedBy = json["cretedBy"];
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
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["nmae"] = nmae;
    _data["description"] = description;
    _data["profileUrl"] = profileUrl;
    if (members != null) {
      _data["members"] = members;
    }
    _data["cretedAt"] = cretedAt;
    _data["cretedBy"] = cretedBy;
    _data["status"] = status;
    _data["lastMessage"] = lastMessage;
    _data["lastMessageTime"] = lastMessageTime;
    _data["lastMessageBy"] = lastMessageBy;
    _data["unReadCount"] = unReadCount;
    _data["timeStamp"] = timeStamp;
    return _data;
  }
}
