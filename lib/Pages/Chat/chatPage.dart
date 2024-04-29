import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hello/Config/images.dart';
import 'package:hello/Controller/ChatController.dart';
import 'package:hello/Controller/ProfileCntroller.dart';
import 'package:hello/Model/UserModel.dart';
import 'package:hello/Pages/Chat/Widgets/TypeMessage.dart';
import 'package:hello/Pages/Chat/Widgets/chatBuddle.dart';
import 'package:hello/Pages/UserProfile/UserProfilePage.dart';
import 'package:intl/intl.dart';

class ChatPage extends StatelessWidget {
  final UserModel userModel;
  const ChatPage({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    ChatController chatController = Get.put(ChatController());
    ProfileController profileController = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            Get.to(UserProfilePage(
              userModel: userModel,
            ));
          },
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: CachedNetworkImage(
                  imageUrl: userModel.profileImage ?? AssetsIamge.defaultProfileUrl,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
          ),
        ),
        title: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            Get.to(UserProfilePage(
              userModel: userModel,
            ));
          },
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userModel.name ?? "User",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    "Online",
                    style: Theme.of(context).textTheme.labelMedium,
                  )
                ],
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.phone),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.video_call),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  StreamBuilder(
                    stream: chatController.getMessages(userModel.id!),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (snapshot.hasError) {
                        return Center(
                          child: Text("Error: ${snapshot.error}"),
                        );
                      }
                      if (snapshot.data == null) {
                        return const Center(
                          child: Text("No Messages"),
                        );
                      } else {
                        return ListView.builder(
                          reverse: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            DateTime timestamp = DateTime.parse(snapshot.data![index].timestamp!);
                            String formattedTime = DateFormat('hh:mm a').format(timestamp);
                            return ChatBubble(
                              message: snapshot.data![index].message!,
                              isComing: snapshot.data![index].receiverId == profileController.currentUser.value.id,
                              time: formattedTime,
                              status: "read",
                              imageUrl: snapshot.data![index].imageUrl ?? "",
                            );
                          },
                        );
                      }
                    },
                  ),
                  Obx(
                    () => (chatController.selectedImagePath.value != "")
                        ? Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Stack(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(bottom: 10),
                                  height: 500,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: FileImage(
                                        File(chatController.selectedImagePath.value),
                                      ),
                                      fit: BoxFit.contain,
                                    ),
                                    color: Theme.of(context).colorScheme.primaryContainer,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                Positioned(
                                    right: 0,
                                    child: IconButton(
                                      onPressed: () {
                                        chatController.selectedImagePath.value = "";
                                      },
                                      icon: Icon(Icons.close),
                                    )),
                              ],
                            ),
                          )
                        : Container(),
                  )
                ],
              ),
            ),
            TypeMessage(userModel: userModel),
          ],
        ),
      ),
    );
  }
}
