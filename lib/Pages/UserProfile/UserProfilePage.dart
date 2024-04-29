import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hello/Config/images.dart';
import 'package:hello/Controller/AuthController.dart';
import 'package:hello/Controller/ProfileCntroller.dart';
import 'package:hello/Model/UserModel.dart';
import 'package:hello/Pages/UserProfile/Widgets/UserInfo.dart';

class UserProfilePage extends StatelessWidget {
  final UserModel userModel;
  const UserProfilePage({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    ProfileController profileController = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed("/updateprofile");
            },
            icon: Icon(
              Icons.edit,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            LoginUserInfo(
              profileImage: userModel.profileImage ?? AssetsIamge.defaultProfileUrl,
              userName: userModel.name ?? "user",
              userEmail: userModel.email ?? "",
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                authController.logoutUser();
              },
              child: Text("Logout"),
            )
          ],
        ),
      ),
    );
  }
}
