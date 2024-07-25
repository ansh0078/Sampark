import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:hello/Config/CustomMessage.dart';
import 'package:hello/Controller/ProfileCntroller.dart';
import 'package:hello/Model/GroupModel.dart';
import 'package:hello/Model/UserModel.dart';
import 'package:hello/Pages/Home/homePage.dart';
import 'package:uuid/uuid.dart';

class GroupController extends GetxController {
  RxList<UserModel> groupMembers = <UserModel>[].obs;
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  var uuid = Uuid();
  RxBool isLoading = false.obs;

  ProfileController profileController = Get.put(ProfileController());
  RxList<GroupModel> groupList = <GroupModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getGroups();
  }

  void selectMember(UserModel user) {
    if (groupMembers.contains(user)) {
      groupMembers.remove(user);
    } else {
      groupMembers.add(user);
    }
  }

  Future<void> createGroup(String groupName, String imagePath) async {
    isLoading.value = true;
    try {
      String groupId = uuid.v6();

      String imageUrl = await profileController.uploadFileToFirebase(imagePath);
      await db.collection("groups").doc(groupId).set(
        {
          "id": groupId,
          "name": groupName,
          "profileUrl": imageUrl,
          "members": groupMembers.map((e) => e.toJson()).toList(),
          "cretedAt": DateTime.now().toString(),
          "cretedBy": auth.currentUser!.uid,
          "timeStamp": DateTime.now().toString(),
        },
      );
      getGroups();
      successMessage("Group Created");
      Get.offAll(HomePage());
      isLoading.value = false;
    } catch (e) {
      print(e);
    }
  }

  Future<void> getGroups() async {
    isLoading.value = true;
    List<GroupModel> tempGroup = [];
    await db.collection('groups').get().then(
      (value) {
        tempGroup = value.docs
            .map(
              (e) => GroupModel.fromJson(e.data()),
            )
            .toList();
      },
    );
    groupList.clear();
    groupList.value = tempGroup
        .where(
          (e) => e.members!.any(
            (element) => element.id == auth.currentUser!.uid,
          ),
        )
        .toList();
    isLoading.value = false;
  }
}
