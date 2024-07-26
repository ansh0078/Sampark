import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hello/Controller/ProfileCntroller.dart';
import 'package:hello/Widget/primaryBtn.dart';

class UserUpdateProfile extends StatelessWidget {
  const UserUpdateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController profileController = Get.put(ProfileController());

    return Scaffold(
      appBar: AppBar(
        title: Text("Update Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(color: Theme.of(context).colorScheme.primaryContainer),
              child: Row(
                children: [
                  Expanded(
                      child: Column(
                    children: [
                      Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.background,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.image,
                            size: 40,
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      Row(
                        children: [
                          Text(
                            "Personal Info ",
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Obx(
                            () => Text(
                              profileController.currentUser.value.name! == null ? "user" : profileController.currentUser.value.name!,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                      TextField(
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          hintText: 'Enter Your Name',
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Obx(
                            () => Text(
                              profileController.currentUser.value.email!,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(prefixIcon: Icon(Icons.alternate_email_rounded), hintText: "Enter Your Email"),
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Text(
                            "Phone",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      TextField(
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          hintText: 'Enter Your Number',
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          PrimaryBtn(btnName: "Save", icon: Icons.save, ontap: () {}),
                        ],
                      )
                    ],
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
