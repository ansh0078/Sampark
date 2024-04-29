import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hello/Controller/AuthController.dart';
import 'package:hello/Widget/primaryBtn.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    AuthController authController = Get.put(AuthController());
    return Column(
      children: [
        const SizedBox(height: 40),
        TextField(
          controller: email,
          decoration: const InputDecoration(
              hintText: "Email",
              prefixIcon: Icon(Icons.alternate_email_outlined)),
        ),
        const SizedBox(height: 40),
        TextField(
          controller: password,
          decoration: const InputDecoration(
              hintText: "Password", prefixIcon: Icon(Icons.password_outlined)),
        ),
        const SizedBox(height: 60),
        Obx(() => authController.isLoading.value
            ? CircularProgressIndicator()
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PrimaryBtn(
                      ontap: () {
                        authController.login(email.text, password.text);
                        // Get.offAllNamed("/homepage");
                      },
                      btnName: "LOGIN",
                      icon: Icons.lock_open_outlined),
                ],
              ))
      ],
    );
  }
}
