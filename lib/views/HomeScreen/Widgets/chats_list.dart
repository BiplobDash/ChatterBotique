import 'package:chatter_botique/utils/exports.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'chat_tile.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ChatTile(
          imageUrl: AppImages.defaultProfileUrl,
          name: "Harry Jansen",
          lastChat: "See You Again",
          lastTime: "08: 55 AM",
          onTap: () {
            Get.toNamed("/chat-screen");
          },
        ),
        ChatTile(
          imageUrl: AppImages.defaultProfileUrl,
          name: "Ton Jansen",
          lastChat: "See You Again",
          lastTime: "08: 55 AM",
          onTap: () {},
        ),
        ChatTile(
          imageUrl: AppImages.defaultProfileUrl,
          name: "Harry Jansen",
          lastChat: "See You Again",
          lastTime: "08: 55 AM",
          onTap: () {},
        ),
        ChatTile(
          imageUrl: AppImages.defaultProfileUrl,
          name: "Ton Jansen",
          lastChat: "See You Again",
          lastTime: "08: 55 AM",
          onTap: () {},
        ),
        ChatTile(
          imageUrl: AppImages.defaultProfileUrl,
          name: "Harry Jansen",
          lastChat: "See You Again",
          lastTime: "08: 55 AM",
          onTap: () {},
        ),
        ChatTile(
          imageUrl: AppImages.defaultProfileUrl,
          name: "Ton Jansen",
          lastChat: "See You Again",
          lastTime: "08: 55 AM",
          onTap: () {},
        ),
        ChatTile(
          imageUrl: AppImages.defaultProfileUrl,
          name: "Harry Jansen",
          lastChat: "See You Again",
          lastTime: "08: 55 AM",
          onTap: () {},
        ),
        ChatTile(
          imageUrl: AppImages.defaultProfileUrl,
          name: "Ton Jansen",
          lastChat: "See You Again",
          lastTime: "08: 55 AM",
          onTap: () {},
        ),
      ],
    );
  }
}
