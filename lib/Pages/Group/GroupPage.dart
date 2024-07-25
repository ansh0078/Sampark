import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hello/Config/images.dart';
import 'package:hello/Controller/GroupController.dart';
import 'package:hello/Pages/Home/Widgets/chatTile.dart';

class GroupPage extends StatelessWidget {
  const GroupPage({super.key});

  @override
  Widget build(BuildContext context) {
    GroupController groupController = Get.put(GroupController());
    return Obx(
      () => ListView(
        children: groupController.groupList
            .map(
              (group) => InkWell(
                onTap: () {},
                child: ChatTile(
                  imageUrl: group.profileUrl == "" ? AssetsIamge.defaultProfileUrl : group.profileUrl!,
                  name: group.name!,
                  lastChat: "Group Created",
                  lastTime: "Just Now",
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
