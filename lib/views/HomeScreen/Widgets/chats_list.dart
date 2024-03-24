
import 'package:chatter_botique/utils/exports.dart';
import 'package:chatter_botique/views/HomeScreen/Widgets/chat_tile.dart';
import 'package:flutter/material.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {

    return ListView(
      children: const [
        ChatTile(imageUrl: AppImages.boyImage, name: "Haris Jansen", lastChat: "Come", lastTime: "08:33 PM",),
        ChatTile(imageUrl: AppImages.girlImage, name: "Sony Jansen", lastChat: "Back", lastTime: "08:38 PM",),
        ChatTile(imageUrl: AppImages.boyImage, name: "Haris Jansen", lastChat: "Come", lastTime: "08:33 PM",),
        ChatTile(imageUrl: AppImages.girlImage, name: "Sony Jansen", lastChat: "Back", lastTime: "08:38 PM",),
        ChatTile(imageUrl: AppImages.boyImage, name: "Haris Jansen", lastChat: "Come", lastTime: "08:33 PM",),
        ChatTile(imageUrl: AppImages.girlImage, name: "Sony Jansen", lastChat: "Back", lastTime: "08:38 PM",),
        ChatTile(imageUrl: AppImages.boyImage, name: "Haris Jansen", lastChat: "Come", lastTime: "08:33 PM",),
        ChatTile(imageUrl: AppImages.girlImage, name: "Sony Jansen", lastChat: "Back", lastTime: "08:38 PM",),

      ],
    );
  }
}
