import 'package:chatter_botique/controller/chat_controller.dart';
import 'package:chatter_botique/controller/profile_controller.dart';
import 'package:chatter_botique/model/chat_model.dart';
import 'package:chatter_botique/model/user_model.dart';
import 'package:chatter_botique/utils/exports.dart';
import 'package:chatter_botique/views/ChatScreen/Widgets/chat_bubble.dart';
import 'package:chatter_botique/views/UserProfileScreen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ChatScreen extends StatelessWidget {
  final UserModel userModel;
  const ChatScreen({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final sz = MediaQuery.sizeOf(context);
    final ChatController chatController = Get.put(ChatController());
    final ProfileController profileController = Get.put(ProfileController());
    TextEditingController messageController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.to(() => UserProfileScreen(userModel: userModel,),);
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Image.asset(AppImages.boyImage),
          ),
        ),
        title: InkWell(
          onTap: () {
            Get.to(() => UserProfileScreen(userModel: userModel,),);
          },
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userModel.name ?? 'User',
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: sz.height * .089,
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: theme.colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              AppImages.micImage,
              width: sz.width * .08,
            ),
            SizedBox(
              width: sz.width * .01,
            ),
            Expanded(
              child: TextField(
                controller: messageController,
                decoration: const InputDecoration(
                    filled: false, hintText: 'Type message ....'),
              ),
            ),
            SizedBox(
              width: sz.width * .01,
            ),
            SvgPicture.asset(
              AppImages.gallaryImage,
              width: sz.width * .08,
            ),
            SizedBox(
              width: sz.width * .01,
            ),
            InkWell(
              onTap: () {
                if (messageController.text.isNotEmpty) {
                  chatController.sendMessage(
                    userModel.id!,
                    messageController.text,
                    userModel,
                  );
                  messageController.clear();
                }
              },
              child: SvgPicture.asset(
                AppImages.sendImage,
                width: sz.width * .08,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.only(
            top: 10.0,
            left: 10,
            right: 10,
            bottom: 70,
          ),
          child: StreamBuilder<List<ChatModel>>(
              stream: chatController.getMessage(userModel.id!),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Text("Error: ${snapshot.error}"),
                  );
                }
                if (snapshot.data == null) {
                  return const Center(
                    child: Text('No Message'),
                  );
                } else {
                  return ListView.builder(
                      reverse: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) {
                        DateTime timeStamp =
                            DateTime.parse(snapshot.data![index].timestamp!);
                        String formattedTime =
                            DateFormat('hh:mm a').format(timeStamp);
                        return ChatBubble(
                          message: snapshot.data![index].message!,
                          isComming: snapshot.data![index].senderId !=
                              profileController.currentUser.value.id,
                          time: formattedTime,
                          status: "read",
                          imageUrl: snapshot.data![index].imageUrl ?? "",
                        );
                      });
                }
              })),
    );
  }
}
