import 'package:chatter_botique/controller/contact_controller.dart';
import 'package:chatter_botique/controller/profile_controller.dart';
import 'package:chatter_botique/utils/exports.dart';
import 'package:chatter_botique/views/ChatScreen/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'chat_tile.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    final ContactController contactController = Get.put(
      ContactController(),
    );
    final ProfileController profileController = Get.put(
      ProfileController(),
    );
    return RefreshIndicator(
        onRefresh: () async {
          await contactController.getChatRoomList();
        },
        child: Obx(
          () => ListView(
              children: contactController.chatRoomList
                  .map(
                    (e) => ChatTile(
                      imageUrl: e.receiver!.profileImage ??
                          AppImages.defaultProfileUrl,
                      name: e.receiver!.name ?? 'User Name',
                      lastChat: e.lastMessage ?? 'Last Message',
                      lastTime: e.lastMessageTimeStamp ?? 'Last time',
                      onTap: () {
                        Get.to(
                          () => ChatScreen(
                            userModel: (e.receiver!.id ==
                                    profileController.currentUser.value.id
                                ? e.sender
                                : e.receiver)!,
                          ),
                        );
                      },
                    ),
                  )
                  .toList()),
        ));
  }
}
