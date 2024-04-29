import 'package:flutter/material.dart';
import 'package:hello/Pages/Auth/widgets/authPageBody.dart';
import 'package:hello/Pages/Welcome/Widgets/welcomeheading.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                WelcomeHeading(), 
                SizedBox(height: 20), 
                AuthPageBody()
                ],
            ),
          ),
        ),
      ),
    );
  }
}
