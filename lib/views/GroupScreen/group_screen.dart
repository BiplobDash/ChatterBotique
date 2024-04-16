import 'package:chatter_botique/utils/exports.dart';
import 'package:chatter_botique/views/HomeScreen/Widgets/chat_tile.dart';
import 'package:flutter/material.dart';

class GroupScreen extends StatelessWidget {
  const GroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ChatTile(
          imageUrl: AppImages.defaultProfileUrl,
          name: "Study Group",
          lastChat: "This is a study group",
          lastTime: "09:00AM",
          onTap: () {},
        ),
      ],
    );
  }
}
