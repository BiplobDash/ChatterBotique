import 'package:get/get.dart';
import '../views/AuthScreen/auth_screen.dart';
import '../views/ChatScreen/chat_screen.dart';
import '../views/HomeScreen/home_screen.dart';

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
  GetPage(
    name: "/chat-screen",
    page: () => const ChatScreen(),
    transition: Transition.rightToLeft,
  ),
];
