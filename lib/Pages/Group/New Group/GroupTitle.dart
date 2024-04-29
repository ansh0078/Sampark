import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hello/Config/images.dart';
import 'package:hello/Controller/GroupController.dart';
import 'package:hello/Controller/ImagePicker.dart';
import 'package:hello/Pages/Home/Widgets/chatTile.dart';
import 'package:image_picker/image_picker.dart';

class GroupTitle extends StatelessWidget {
  const GroupTitle({super.key});

  @override
  Widget build(BuildContext context) {
    GroupController groupController = Get.put(GroupController());
    ImagePickerController imagePickerController = Get.put(ImagePickerController());
    RxString groupName = "".obs;
    RxString imagePath = "".obs;
    return Scaffold(
      appBar: AppBar(
        title: Text("New Group"),
      ),
      floatingActionButton: Obx(
        () => FloatingActionButton(
          backgroundColor: groupName.isEmpty ? Colors.grey : Theme.of(context).colorScheme.primary,
          onPressed: () {
            if (groupName.isEmpty) {
              Get.snackbar("Error", "please enter group name");
            } else {
              groupController.createGroup(groupName.value, imagePath.value);
            }
          },
          child: groupController.isLoading.value
              ? const CircularProgressIndicator(
                  color: Colors.white,
                )
              : Icon(
                  Icons.done,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Obx(
                        () => InkWell(
                          onTap: () async {
                            imagePath.value = await imagePickerController.pickImage((ImageSource.gallery));
                          },
                          child: Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: imagePath.value == ""
                                ? const Icon(
                                    Icons.group,
                                    size: 40,
                                  )
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Image.file(
                                      File(imagePath.value),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        onChanged: (Value) {
                          groupName.value = Value;
                        },
                        decoration: InputDecoration(
                          hintText: "Group Name",
                          prefixIcon: Icon(Icons.group),
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: groupController.groupMembers
                    .map(
                      (e) => ChatTile(
                        imageUrl: e.profileImage ?? AssetsIamge.defaultProfileUrl,
                        name: e.name!,
                        lastChat: e.about ?? '',
                        lastTime: "",
                      ),
                    )
                    .toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
