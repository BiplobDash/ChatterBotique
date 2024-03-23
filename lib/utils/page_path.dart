import 'package:chatter_botique/views/AuthScreen/auth_screen.dart';
import 'package:get/get.dart';

var pagePath = [
  GetPage(
    name: "/auth-screen",
    page: () => const AuthScreen(),
    transition: Transition.rightToLeft,
  ),
];
