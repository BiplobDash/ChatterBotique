import 'package:chatter_botique/views/AuthScreen/auth_screen.dart';
import 'package:chatter_botique/views/HomeScreen/home_screen.dart';
import 'package:get/get.dart';

var pagePath = [
  GetPage(
    name: "/auth-screen",
    page: () => const AuthScreen(),
    transition: Transition.rightToLeft,
  ),
  GetPage(
    name: "/home-screen",
    page: () => const HomeScreen(),
    transition: Transition.rightToLeft,
  ),
];
