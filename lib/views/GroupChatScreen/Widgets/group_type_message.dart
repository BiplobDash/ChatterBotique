import 'package:chatter_botique/controller/group_controller.dart';
import 'package:chatter_botique/controller/image_controller.dart';
import 'package:chatter_botique/model/groud_model.dart';
import 'package:chatter_botique/widgets/imagepicker_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../utils/exports.dart';

class GroupTypeMessage extends StatelessWidget {
  final GroupModelUser groupModel;
  const GroupTypeMessage({super.key, required this.groupModel});

  @override
  Widget build(BuildContext context) {
    TextEditingController messageController = TextEditingController();
    final ImageController imageController = Get.put(
      ImageController(),
    );
    final GroupController groupController = Get.put(GroupController());
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
              imagePickerBottomSheet(theme, groupController.selectedImagePath, imageController);
            },
            child: SvgPicture.asset(
              AppImages.gallaryImage,
              width: sz.width * .08,
            ),
          ),
          SizedBox(
            width: sz.width * .01,
          ),
          Obx(
            () => message.value != "" ||
                    groupController.selectedImagePath.value != ''
                ? InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      groupController.sendGroupMessage(
                          messageController.text, groupModel.id!, "");
                      messageController.clear();
                      message.value = "";
                    },
                    child: groupController.isLoading.value
                        ? const CircularProgressIndicator()
                        : SvgPicture.asset(
                            AppImages.sendImage,
                            width: sz.width * .08,
                          ),
                  )
                : SvgPicture.asset(
                    AppImages.micImage,
                    width: sz.width * .08,
                  ),
          ),
        ],
      ),
    );
  }
}
