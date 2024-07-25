import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hello/Config/images.dart';
import 'package:hello/Config/string.dart';
import 'package:hello/Controller/ContactController.dart';
import 'package:hello/Controller/GroupController.dart';
// import 'package:hello/Controller/ImagePicker.dart';
import 'package:hello/Controller/ProfileCntroller.dart';
import 'package:hello/Pages/Group/GroupPage.dart';
import 'package:hello/Pages/Home/Widgets/chatList.dart';
import 'package:hello/Pages/Home/Widgets/tabBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    ProfileController profileController = Get.put(ProfileController());
    // ImagePickerController imagePickerController = Get.put(ImagePickerController());
    ContactController contactController = Get.put(ContactController());
    GroupController groupController = Get.put(GroupController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: Text(
          AppString.appName,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            AssetsIamge.appIconSVG,
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              contactController.getChatRoomList();
            },
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () async {
              await profileController.getUserDetails();
              Get.toNamed("/profilePage");
            },
            icon: Icon(Icons.more_vert),
          )
        ],
        bottom: myTabBar(tabController, context),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed("/contactPage");
        },
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.onBackground,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: TabBarView(
          controller: tabController,
          children: [
            ChatList(),
            GroupPage(),
            ListView(
              children: [
                ListTile(
                  title: Text("Name Ansh"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
