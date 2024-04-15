import 'package:chatter_botique/controller/chat_controller.dart';
import 'package:chatter_botique/controller/image_controller.dart';
import 'package:chatter_botique/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../utils/exports.dart';

class TypeMessage extends StatelessWidget {
  final UserModel userModel;
  const TypeMessage({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    TextEditingController messageController = TextEditingController();
    final ChatController chatController = Get.put(ChatController());
    final ImageController imageController = Get.put(
      ImageController(),
    );
    final theme = Theme.of(context);
    final sz = MediaQuery.sizeOf(context);
    RxString message = "".obs;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            AppImages.emojiImage,
            width: sz.width * .08,
          ),
          SizedBox(
            width: sz.width * .01,
          ),
          Expanded(
            child: TextField(
              controller: messageController,
              onChanged: (value) {
                message.value = value;
              },
              decoration: const InputDecoration(
                  filled: false, hintText: 'Type message ....'),
            ),
          ),
          SizedBox(
            width: sz.width * .01,
          ),
          InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              chatController.selectedImagePath.value =
                  await imageController.pickImage();
            },
            child: SvgPicture.asset(
              AppImages.gallaryImage,
              width: sz.width * .08,
            ),
          ),
          SizedBox(
            width: sz.width * .01,
          ),
          Obx(() => message.value != "" ||
                  chatController.selectedImagePath.value != ''
              ? InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    if (messageController.text.isNotEmpty || chatController.selectedImagePath.value.isNotEmpty) {
                      chatController.sendMessage(
                        userModel.id!,
                        messageController.text,
                        userModel,
                      );
                      messageController.clear();
                      message.value = "";
                    }
                  },
                  child: chatController.isLoading.value ? const CircularProgressIndicator() : SvgPicture.asset(
                    AppImages.sendImage,
                    width: sz.width * .08,
                  ),
                )
              : SvgPicture.asset(
                  AppImages.micImage,
                  width: sz.width * .08,
                )),
        ],
      ),
    );
  }
}
