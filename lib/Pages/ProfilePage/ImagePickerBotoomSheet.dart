import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hello/Controller/ChatController.dart';
import 'package:hello/Controller/ImagePicker.dart';
import 'package:image_picker/image_picker.dart';

Future<dynamic> ImagePickerBottomSheet(BuildContext context, ChatController chatController, ImagePickerController imagePickerController) {
  return Get.bottomSheet(
    Container(
      height: 150,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () async {
              chatController.selectedImagePath.value = await imagePickerController.pickImage(ImageSource.camera);
              Get.back();
            },
            child: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Icon(
                Icons.camera,
                size: 30,
              ),
            ),
          ),
          InkWell(
            onTap: () async {
              chatController.selectedImagePath.value = await imagePickerController.pickImage(ImageSource.gallery);
              Get.back();
            },
            child: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Icon(
                Icons.photo,
                size: 30,
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Icon(
                Icons.play_arrow,
                size: 30,
              ),
            ),
          )
        ],
      ),
    ),
  );
}
