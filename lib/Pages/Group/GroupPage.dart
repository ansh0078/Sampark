import 'package:flutter/material.dart';
import 'package:hello/Config/images.dart';
import 'package:hello/Pages/Home/Widgets/chatTile.dart';

class GroupPage extends StatelessWidget {
  const GroupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ChatTile(
          imageUrl: AssetsIamge.defaultProfileUrl,
          name: "Study Group",
          lastChat: "Last Message",
          lastTime: "Last Time",
        )
      ],
    );
  }
}
