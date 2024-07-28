import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SplaceController extends GetxController {
  final auth = FirebaseAuth.instance;

  void onInit() async {
    super.onInit();
    splashHandle();
  }

  void splashHandle() async {
    await Future.delayed(
      Duration(seconds: 3),
    );
    if (auth.currentUser == null) {
      Get.offAllNamed("/welcomePage");
    } else {
      Get.offAllNamed("/homepage");
      print(auth.currentUser!.email);
    }
    print("hello");
  }
}
