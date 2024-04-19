import 'package:chatter_botique/controller/chat_controller.dart';
import 'package:chatter_botique/controller/group_controller.dart';
import 'package:chatter_botique/controller/image_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

Future<dynamic> imagePickerBottomSheet(ThemeData theme, ChatController chatController, ImageController imageController) {
    return Get.bottomSheet(Container(
      height: 150,
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () async {
              chatController.selectedImagePath.value =
                  await imageController.pickImage(ImageSource.camera);
              Get.back();
            },
            child: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                  color: theme.colorScheme.background,
                  borderRadius: BorderRadius.circular(15)),
              child: const Icon(
                Icons.camera,
                size: 30,
              ),
            ),
          ),
          InkWell(
            onTap: () async {
              chatController.selectedImagePath.value =
                  await imageController.pickImage(ImageSource.gallery);
              Get.back();
            },
            child: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                  color: theme.colorScheme.background,
                  borderRadius: BorderRadius.circular(15)),
              child: const Icon(
                Icons.image,
                size: 30,
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                  color: theme.colorScheme.background,
                  borderRadius: BorderRadius.circular(15)),
              child: const Icon(
                Icons.play_arrow,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    ));
  }

Future<dynamic> imagePickerBottomSheetGroup(ThemeData theme, GroupController groupController, ImageController imageController) {
    return Get.bottomSheet(Container(
      height: 150,
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () async {
              groupController.selectedImagePath.value =
                  await imageController.pickImage(ImageSource.camera);
              Get.back();
            },
            child: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                  color: theme.colorScheme.background,
                  borderRadius: BorderRadius.circular(15)),
              child: const Icon(
                Icons.camera,
                size: 30,
              ),
            ),
          ),
          InkWell(
            onTap: () async {
              groupController.selectedImagePath.value =
                  await imageController.pickImage(ImageSource.gallery);
              Get.back();
            },
            child: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                  color: theme.colorScheme.background,
                  borderRadius: BorderRadius.circular(15)),
              child: const Icon(
                Icons.image,
                size: 30,
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                  color: theme.colorScheme.background,
                  borderRadius: BorderRadius.circular(15)),
              child: const Icon(
                Icons.play_arrow,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    ));
  }