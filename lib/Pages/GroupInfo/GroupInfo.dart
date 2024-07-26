import 'package:flutter/material.dart';
import 'package:hello/Config/images.dart';
import 'package:hello/Model/GroupModel.dart';
import 'package:hello/Pages/GroupInfo/GroupMemberInfo.dart';
import 'package:hello/Pages/Home/Widgets/chatTile.dart';

class GroupInfo extends StatelessWidget {
  final GroupModel groupModel;
  const GroupInfo({super.key, required this.groupModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(groupModel.name!),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            GroupMemberInfo(
              groupId: groupModel.id!,
              profileImage: groupModel.profileUrl == "" ? AssetsIamge.defaultProfileUrl : groupModel.profileUrl!,
              userName: groupModel.name!,
              userEmail: groupModel.description ?? "No Description Available",
            ),
            SizedBox(height: 20),
            Text(
              "Members",
              style: Theme.of(context).textTheme.labelMedium,
            ),
            SizedBox(height: 10),
            Column(
              children: groupModel.members!
                  .map(
                    (member) => ChatTile(
                      imageUrl: member.profileImage ?? AssetsIamge.defaultProfileUrl,
                      name: member.name!,
                      lastChat: member.email!,
                      lastTime: member.role == "admin" ? "Admin" : "User",
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
