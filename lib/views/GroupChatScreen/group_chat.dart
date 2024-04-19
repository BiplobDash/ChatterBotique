import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chatter_botique/controller/chat_controller.dart';
import 'package:chatter_botique/controller/group_controller.dart';
import 'package:chatter_botique/controller/profile_controller.dart';
import 'package:chatter_botique/model/chat_model.dart';
import 'package:chatter_botique/model/groud_model.dart';
import 'package:chatter_botique/utils/exports.dart';
import 'package:chatter_botique/views/ChatScreen/Widgets/chat_bubble.dart';
import 'package:chatter_botique/views/GroupChatScreen/Widgets/group_type_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class GroupChatScreen extends StatelessWidget {
  final GroupModelUser groupModel;
  const GroupChatScreen({super.key, required this.groupModel});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final ChatController chatController = Get.put(ChatController());
    final ProfileController profileController = Get.put(ProfileController());
    final GroupController groupController = Get.put(GroupController());
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            // Get.to(
            //   () => UserProfileScreen(
            //     userModel: userModel,
            //   ),
            // );
          },
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: CachedNetworkImage(
                imageUrl: groupModel.profileUrl ?? AppImages.defaultProfileUrl,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
        ),
        title: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            // Get.to(
            //   () => UserProfileScreen(
            //     userModel: userModel,
            //   ),
            // );
          },
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    groupModel.name ?? 'Group Name',
                    style: theme.textTheme.bodyLarge,
                  ),
                  Text(
                    'Online',
                    style: theme.textTheme.labelSmall,
                  ),
                ],
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.phone),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.video_call),
          ),
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.only(
            top: 10.0,
            left: 10,
            right: 10,
            bottom: 0,
          ),
          child: Column(
            children: [
              Expanded(
                  child: Stack(
                children: [
                  StreamBuilder<List<ChatModel>>(
                      stream: groupController.getGroupMessages(groupModel.id!),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (snapshot.hasError) {
                          return Center(
                            child: Text("Error: ${snapshot.error}"),
                          );
                        }
                        if (snapshot.data == null || snapshot.data!.isEmpty) {
                          return Center(
                            child: Text('No Message',
                                style: theme.textTheme.bodyLarge),
                          );
                        } else {
                          return ListView.builder(
                              reverse: true,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (_, index) {
                                DateTime timeStamp = DateTime.parse(
                                    snapshot.data![index].timestamp!);
                                String formattedTime =
                                    DateFormat('hh:mm a').format(timeStamp);
                                return ChatBubble(
                                  message: snapshot.data![index].message!,
                                  isComming: snapshot.data![index].senderId !=
                                      profileController.currentUser.value.id,
                                  time: formattedTime,
                                  status: "read",
                                  imageUrl:
                                      snapshot.data![index].imageUrl ?? "",
                                );
                              });
                        }
                      }),
                  Obx(
                    () => (chatController.selectedImagePath.value != "")
                        ? Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Stack(
                              children: [
                                Container(
                                  height: 500,
                                  margin: const EdgeInsets.only(bottom: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: theme.colorScheme.primaryContainer,
                                    image: DecorationImage(
                                      image: FileImage(
                                        File(chatController
                                            .selectedImagePath.value),
                                      ),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 0,
                                  child: IconButton(
                                    onPressed: () {
                                      chatController.selectedImagePath.value =
                                          '';
                                    },
                                    icon: const Icon(Icons.close),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container(),
                  ),
                ],
              )),
              GroupTypeMessage(groupModel: groupModel),
            ],
          )),
    );
  }
}
