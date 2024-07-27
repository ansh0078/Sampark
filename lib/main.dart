import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hello/Config/pagePath.dart';
import 'package:hello/Config/theme.dart';
import 'package:hello/Controller/CallController.dart';
import 'package:hello/Pages/SplacePage/splacepage.dart';
import 'package:hello/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    CallController callController = Get.put(CallController());
    return GetMaterialApp(
      builder: FToastBuilder(),
      debugShowCheckedModeBanner: false,
      title: 'Hello',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.dark,
      getPages: pagePath,
      home: const SplacePage(),
    );
  }
}
