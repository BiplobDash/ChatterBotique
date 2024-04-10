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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Contact'),
        actions: [
          Obx(() => IconButton(
            onPressed: () {
              isSearchEnable.value = !isSearchEnable.value;
            },
            icon: isSearchEnable.value
                ? const Icon(Icons.close)
                : const Icon(Icons.search),
          ),),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Obx(() => isSearchEnable.value ? const ContactSearch() : const SizedBox(),),
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
            Column(
              children: [
                ChatTile(
                  imageUrl: AppImages.boyImage,
                  name: "Harry Jansen",
                  lastChat: "See You Again",
                  lastTime: "08: 55 AM",
                  onTap: () {
                    Get.toNamed("/chat-screen");
                  },
                ),
                ChatTile(
                  imageUrl: AppImages.girlImage,
                  name: "Ton Jansen",
                  lastChat: "See You Again",
                  lastTime: "08: 55 AM",
                  onTap: () {},
                ),
                ChatTile(
                  imageUrl: AppImages.boyImage,
                  name: "Harry Jansen",
                  lastChat: "See You Again",
                  lastTime: "08: 55 AM",
                  onTap: () {},
                ),
                ChatTile(
                  imageUrl: AppImages.girlImage,
                  name: "Ton Jansen",
                  lastChat: "See You Again",
                  lastTime: "08: 55 AM",
                  onTap: () {},
                ),
                ChatTile(
                  imageUrl: AppImages.boyImage,
                  name: "Harry Jansen",
                  lastChat: "See You Again",
                  lastTime: "08: 55 AM",
                  onTap: () {},
                ),
                ChatTile(
                  imageUrl: AppImages.girlImage,
                  name: "Ton Jansen",
                  lastChat: "See You Again",
                  lastTime: "08: 55 AM",
                  onTap: () {},
                ),
                ChatTile(
                  imageUrl: AppImages.boyImage,
                  name: "Harry Jansen",
                  lastChat: "See You Again",
                  lastTime: "08: 55 AM",
                  onTap: () {},
                ),
                ChatTile(
                  imageUrl: AppImages.girlImage,
                  name: "Ton Jansen",
                  lastChat: "See You Again",
                  lastTime: "08: 55 AM",
                  onTap: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
