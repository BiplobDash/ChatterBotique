import 'package:chatter_botique/controller/group_controller.dart';
import 'package:chatter_botique/utils/exports.dart';
import 'package:chatter_botique/views/HomeScreen/Widgets/chat_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GroupTitle extends StatelessWidget {
  const GroupTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final GroupController groupController = Get.put(GroupController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Group'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: theme.colorScheme.primary,
        onPressed: () {},
        child: Icon(
          Icons.done,
          color: theme.colorScheme.onBackground,
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
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primary,
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
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
