import 'package:chatter_botique/controller/group_controller.dart';
import 'package:chatter_botique/utils/exports.dart';
import 'package:chatter_botique/views/GroupChatScreen/group_chat.dart';
import 'package:chatter_botique/views/HomeScreen/Widgets/chat_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GroupScreen extends StatelessWidget {
  const GroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GroupController groupController = Get.put(GroupController());
    return Obx(
      () => ListView(
        children: groupController.groupList
            .map(
              (group) => ChatTile(
                imageUrl: group.profileUrl ?? AppImages.defaultProfileUrl,
                name: group.name!,
                lastChat: "Group Created",
                lastTime: "Just Now",
                onTap: () {
                  Get.to(
                    () => GroupChatScreen(groupModel: group),
                  );
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
