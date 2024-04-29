import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hello/Config/images.dart';
import 'package:hello/Controller/ChatController.dart';
import 'package:hello/Controller/ContactController.dart';
import 'package:hello/Controller/ProfileCntroller.dart';
import 'package:hello/Pages/Chat/chatPage.dart';
import 'package:hello/Pages/ContactPage/Widgets/ContactSearch.dart';
import 'package:hello/Pages/ContactPage/Widgets/NewContactTile.dart';
import 'package:hello/Pages/Group/New%20Group/NewGroup.dart';
import 'package:hello/Pages/Home/Widgets/chatTile.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool isSearchEnable = false.obs;
    ContactController contactController = Get.put(ContactController());
    ChatController chatController = Get.put(ChatController());
    ProfileController profileController = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Contact"),
        actions: [
          Obx(
            () => IconButton(
              onPressed: () {
                isSearchEnable.value = !isSearchEnable.value;
              },
              icon: isSearchEnable.value ? Icon(Icons.close) : Icon(Icons.search),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Obx(
              () => isSearchEnable.value ? ContactSearch() : SizedBox(),
            ),
            const SizedBox(height: 10),
            NewContactTile(
              btnName: "New Contact",
              icon: Icons.person_add,
              ontap: () {},
            ),
            const SizedBox(height: 20),
            NewContactTile(
              btnName: "New Group",
              icon: Icons.person_add,
              ontap: () {
                Get.to(NewGroup());
              },
            ),
            const SizedBox(height: 20),
            const Row(
              children: [
                Text("Contacts on Hello")
              ],
            ),
            const SizedBox(height: 10),
            Obx(
              () => Column(
                  children: contactController.userList
                      .map(
                        (e) => InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            Get.to(ChatPage(userModel: e));
                          },
                          child: ChatTile(
                            imageUrl: e.profileImage ?? AssetsIamge.defaultProfileUrl,
                            name: e.name ?? "User",
                            lastChat: e.about ?? "New Message...",
                            lastTime: e.email == profileController.currentUser.value.email ? "you" : " ",
                          ),
                        ),
                      )
                      .toList()),
            )
          ],
        ),
      ),
    );
  }
}
