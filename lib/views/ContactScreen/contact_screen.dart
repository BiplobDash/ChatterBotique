import 'package:chatter_botique/controller/contact_controller.dart';
import 'package:chatter_botique/controller/profile_controller.dart';
import 'package:chatter_botique/views/ChatScreen/chat_screen.dart';
import 'package:chatter_botique/views/ContactScreen/Widgets/new_contact_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/exports.dart';
import '../HomeScreen/Widgets/chat_tile.dart';
import 'Widgets/contact_search.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    RxBool isSearchEnable = false.obs;
    final ContactController contactController = Get.put(
      ContactController(),
    );
    final ProfileController profileController = Get.put(
      ProfileController(),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Contact'),
        actions: [
          Obx(
            () => IconButton(
              onPressed: () {
                isSearchEnable.value = !isSearchEnable.value;
              },
              icon: isSearchEnable.value
                  ? const Icon(Icons.close)
                  : const Icon(Icons.search),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Obx(
              () => isSearchEnable.value
                  ? const ContactSearch()
                  : const SizedBox(),
            ),
            const SizedBox(
              height: 10,
            ),
            NewContactTile(
              btnName: "New Contact",
              icon: Icons.person_add,
              onTap: () {},
            ),
            const SizedBox(
              height: 10,
            ),
            NewContactTile(
              btnName: "New Group",
              icon: Icons.group_add,
              onTap: () {},
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Contacts on ChatterBotique',
              style: theme.textTheme.bodyLarge,
            ),
            const SizedBox(
              height: 10,
            ),
            Obx(
              () => Column(
                children: contactController.userList
                    .map(
                      (e) => ChatTile(
                        imageUrl: e.profileImage ?? AppImages.defaultProfileUrl,
                        name: e.name ?? "User",
                        lastChat: e.about ?? "Hey there",
                        lastTime:
                            e.email == profileController.currentUser.value.email
                                ? "You"
                                : "",
                        onTap: () {
                          Get.to(() => ChatScreen(userModel: e));
                        },
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
