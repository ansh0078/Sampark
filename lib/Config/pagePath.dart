import 'package:get/get.dart';
import 'package:hello/Pages/Auth/authPage.dart';
import 'package:hello/Pages/ContactPage/ContactPage.dart';
import 'package:hello/Pages/Home/homePage.dart';
import 'package:hello/Pages/ProfilePage/ProfilePage.dart';
// import 'package:hello/Pages/UserProfile/UserProfilePage.dart';
// import 'package:hello/Pages/UserProfile/Widgets/UpdateProfile.dart';

var pagePath = [
  GetPage(
    name: "/authPage",
    page: () => AuthPage(),
    transition: Transition.rightToLeft,
  ),
  GetPage(
    name: "/homepage",
    page: () => HomePage(),
    transition: Transition.rightToLeft,
  ),
  // GetPage(
  //   name: "/chatpage",
  //   page: () => ChatPage(),
  //   transition: Transition.rightToLeft,
  // ),
  // GetPage(
  //   name: "/profilepage",
  //   page: () => UserProfilePage(),
  //   transition: Transition.rightToLeft,
  // ),
  // GetPage(
  //   name: "/updateprofile",
  //   page: () => UserUpdateProfile(),
  //   transition: Transition.rightToLeft,
  // )
  GetPage(
    name: "/profilePage",
    page: () => ProfilePage(),
    transition: Transition.rightToLeft,
  ),
  GetPage(
    name: "/contactPage",
    page: () => ContactPage(),
    transition: Transition.rightToLeft,
  ),
];
