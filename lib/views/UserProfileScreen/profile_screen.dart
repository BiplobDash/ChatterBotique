import 'package:chatter_botique/controller/auth_controller.dart';
import 'package:chatter_botique/views/UserProfileScreen/Widgets/user_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(
      AuthController(),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed("/userUpdate-profile");
            },
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const LoginUserInfo(),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                authController.logoutUser();
              },
              child: const Text('Log Out'),
            ),
          ],
        ),
      ),
    );
  }
}
