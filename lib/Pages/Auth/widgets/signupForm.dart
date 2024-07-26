import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hello/Controller/AuthController.dart';
import 'package:hello/Widget/primaryBtn.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    AuthController authController = Get.put(AuthController());
    return Column(
      children: [
        const SizedBox(height: 30),
        TextField(
          controller: name,
          decoration: const InputDecoration(hintText: "Full Name", prefixIcon: Icon(Icons.person)),
        ),
        const SizedBox(height: 30),
        TextField(
          controller: email,
          decoration: const InputDecoration(hintText: "Email", prefixIcon: Icon(Icons.alternate_email_outlined)),
        ),
        const SizedBox(height: 30),
        TextField(
          controller: password,
          decoration: const InputDecoration(hintText: "Password", prefixIcon: Icon(Icons.password_outlined)),
        ),
        const SizedBox(height: 60),
        Obx(() => authController.isLoading.value
            ? const CircularProgressIndicator()
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PrimaryBtn(
                      ontap: () {
                        authController.createUser(
                          email.text,
                          password.text,
                          name.text,
                        );
                        // Get.offAllNamed("/homepage");
                      },
                      btnName: "SIGNUP",
                      icon: Icons.lock_open_outlined),
                ],
              ))
      ],
    );
  }
}
