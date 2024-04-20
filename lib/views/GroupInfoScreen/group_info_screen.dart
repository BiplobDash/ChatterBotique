import 'package:chatter_botique/model/groud_model.dart';
import 'package:chatter_botique/utils/exports.dart';
import 'package:chatter_botique/views/GroupInfoScreen/GroupMemberInfoScreen/group_member_info.dart';
import 'package:chatter_botique/views/HomeScreen/Widgets/chat_tile.dart';
import 'package:flutter/material.dart';

class GroupInfoScreen extends StatelessWidget {
  final GroupModelUser groupModelUser;
  const GroupInfoScreen({super.key, required this.groupModelUser});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(groupModelUser.name!),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            GroupMemberInfo(
              groupId: groupModelUser.id!,
              profileImage:
                  groupModelUser.profileUrl ?? AppImages.defaultProfileUrl,
              userName: groupModelUser.name!,
              userEmail:
                  groupModelUser.discription ?? "No Description Available.",
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Members',
              style: theme.textTheme.labelMedium,
            ),
            Column(
              children: groupModelUser.members!
                  .map(
                    (member) => ChatTile(
                      imageUrl:
                          member.profileImage ?? AppImages.defaultProfileUrl,
                      name: member.name!,
                      lastChat: member.email ?? "",
                      lastTime: member.role == "admin" ? "Admin" : "User",
                      onTap: () {},
                    ),
                  )
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
