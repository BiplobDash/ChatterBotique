import 'package:get/get.dart';
import '../views/AuthScreen/auth_screen.dart';
import '../views/ChatScreen/chat_screen.dart';
import '../views/HomeScreen/home_screen.dart';
import '../views/ProfileScreen/profile_screen.dart';
import '../views/UserProfileScreen/UserUpdateProfileScreen/update_profile_screen.dart';
import '../views/UserProfileScreen/profile_screen.dart';

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
  GetPage(
    name: "/profile-screen",
    page: () => const ProfileScreen(),
    transition: Transition.rightToLeft,
  ),
  GetPage(
    name: "/userProfile-screen",
    page: () => const UserProfileScreen(),
    transition: Transition.rightToLeft,
  ),
  GetPage(
    name: "/userUpdate-profile",
    page: () => const UserUpdateProfileScreen(),
    transition: Transition.rightToLeft,
  ),
];
