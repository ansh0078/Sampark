import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hello/Config/images.dart';
import 'package:hello/Controller/ChatController.dart';
import 'package:hello/Controller/ImagePicker.dart';
import 'package:hello/Model/UserModel.dart';
import 'package:hello/Pages/ProfilePage/ImagePickerBotoomSheet.dart';

class TypeMessage extends StatelessWidget {
  final UserModel userModel;
  const TypeMessage({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    ChatController chatController = Get.put(ChatController());
    TextEditingController messageController = TextEditingController();
    ImagePickerController imagePickerController = Get.put(ImagePickerController());
    RxString message = "".obs;
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: Theme.of(context).colorScheme.primaryContainer),
      child: Row(
        children: [
          Container(
            width: 30,
            height: 30,
            child: SvgPicture.asset(
              AssetsIamge.chatEmojiSVG,
              width: 25,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              onChanged: (value) {
                message.value = value;
              },
              controller: messageController,
              decoration: const InputDecoration(filled: false, hintText: "Type Message..."),
            ),
          ),
          SizedBox(width: 10),
          Obx(
            () => chatController.selectedImagePath.value == ""
                ? InkWell(
                    onTap: () async {
                      ImagePickerBottomSheet(context, chatController, imagePickerController);
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      child: SvgPicture.asset(
                        AssetsIamge.chatGallerySVG,
                        width: 25,
                      ),
                    ),
                  )
                : SizedBox(),
          ),
          SizedBox(width: 10),
          Obx(
            () => message.value != "" || chatController.selectedImagePath.value != ""
                ? InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      if (messageController.text.isNotEmpty || chatController.selectedImagePath.value.isNotEmpty) {
                        chatController.sendMessage(userModel.id!, messageController.text, userModel);
                        messageController.clear();
                        message.value = "";
                      }
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      child: chatController.isLoading.value
                          ? const CircularProgressIndicator()
                          : SvgPicture.asset(
                              AssetsIamge.chatSendSVG,
                              width: 25,
                            ),
                    ),
                  )
                : Container(
                    width: 30,
                    height: 30,
                    child: SvgPicture.asset(
                      AssetsIamge.chatMicSVG,
                      width: 25,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
