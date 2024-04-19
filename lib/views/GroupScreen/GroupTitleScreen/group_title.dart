import 'dart:io';
import 'package:chatter_botique/controller/group_controller.dart';
import 'package:chatter_botique/controller/image_controller.dart';
import 'package:chatter_botique/utils/exports.dart';
import 'package:chatter_botique/views/HomeScreen/Widgets/chat_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class GroupTitle extends StatelessWidget {
  const GroupTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final GroupController groupController = Get.put(GroupController());
    final ImageController imageController = Get.put(ImageController());
    RxString groupName = "".obs;
    RxString imagePath = "".obs;
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Group'),
      ),
      floatingActionButton: Obx(
        () => FloatingActionButton(
          backgroundColor:
              groupName.value.isEmpty ? Colors.grey : theme.colorScheme.primary,
          onPressed: () {
            if (groupName.value.isEmpty) {
              Get.snackbar('Error', 'Please enter group name');
            } else {
              groupController.createGroup(groupName.value, imagePath.value);
            }
          },
          child: groupController.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                )
              : Icon(
                  Icons.done,
                  color: theme.colorScheme.onBackground,
                ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: theme.colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Obx(
                          () => InkWell(
                            highlightColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            onTap: () async {
                              imagePath.value = await imageController
                                  .pickImage(ImageSource.gallery);
                            },
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: theme.colorScheme.primary,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: imagePath.value == ""
                                  ? const Icon(
                                      Icons.group,
                                      size: 40,
                                    )
                                  : ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Image.file(
                                        File(
                                          imagePath.value,
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          onChanged: (value) {
                            groupName.value = value;
                          },
                          decoration: const InputDecoration(
                            hintText: 'Group Name',
                            prefixIcon: Icon(
                              Icons.group,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: groupController.groupMembers
                    .map((e) => ChatTile(
                        imageUrl: e.profileImage ?? AppImages.defaultProfileUrl,
                        name: e.name!,
                        lastChat: e.about ?? '',
                        lastTime: '',
                        onTap: () {}))
                    .toList(),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
