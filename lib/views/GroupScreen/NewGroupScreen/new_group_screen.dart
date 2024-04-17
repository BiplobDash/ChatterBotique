import 'package:chatter_botique/controller/contact_controller.dart';
import 'package:chatter_botique/controller/group_controller.dart';
import 'package:chatter_botique/utils/exports.dart';
import 'package:chatter_botique/views/GroupScreen/GroupTitleScreen/group_title.dart';
import 'package:chatter_botique/views/GroupScreen/NewGroupScreen/Widgets/selected_members_list.dart';
import 'package:chatter_botique/views/HomeScreen/Widgets/chat_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewGroupScreen extends StatelessWidget {
  const NewGroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ContactController contactController = Get.put(ContactController());
    final GroupController groupController = Get.put(GroupController());
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Group"),
      ),
      floatingActionButton: Obx(() => FloatingActionButton(
        backgroundColor: groupController.groupMembers.isEmpty ? Colors.grey : theme.colorScheme.primary,
        onPressed: () {
          if (groupController.groupMembers.isEmpty) {
            Get.snackbar('Error', 'Please select at last one member');
          } else {
            Get.to(() => const GroupTitle());
          }
        },
        child: Icon(Icons.arrow_forward, color: theme.colorScheme.onBackground,),
      ),),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const SelectedMembers(),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  "Contact on ChatterBotique",
                  style: theme.textTheme.labelMedium,
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: StreamBuilder(
                  stream: contactController.getContacts(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (_, index) {
                            return ChatTile(
                                imageUrl: snapshot.data![index].profileImage ??
                                    AppImages.defaultProfileUrl,
                                name: snapshot.data![index].name!,
                                lastChat: snapshot.data![index].about ?? '',
                                lastTime: '',
                                onTap: () {
                                  groupController
                                      .selectMember(snapshot.data![index]);
                                });
                          });
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text("${snapshot.error}"),
                      );
                    } else {
                      return const Center(
                        child: Text("No Contact Found"),
                      );
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
