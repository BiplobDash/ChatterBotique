import 'package:cached_network_image/cached_network_image.dart';
import 'package:chatter_botique/controller/group_controller.dart';
import 'package:chatter_botique/model/user_model.dart';
import 'package:chatter_botique/utils/exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class GroupMemberInfo extends StatelessWidget {
  final String profileImage;
  final String userName;
  final String userEmail;
  final String groupId;
  const GroupMemberInfo({
    super.key,
    required this.profileImage,
    required this.userName,
    required this.userEmail,
    required this.groupId,
  });

  @override
  Widget build(BuildContext context) {
    final sz = MediaQuery.sizeOf(context);
    final theme = Theme.of(context);
    final GroupController groupController = Get.put(GroupController());
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 150,
                      height: 150,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: CachedNetworkImage(
                          imageUrl: profileImage,
                          fit: BoxFit.cover,
                          width: 55,
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: sz.height * .02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      userName,
                      style: theme.textTheme.bodyLarge,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      userEmail,
                      style: theme.textTheme.labelLarge,
                    ),
                  ],
                ),
                SizedBox(
                  height: sz.height * .02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _commonContainer(
                        context,
                        'Call',
                        AppImages.profileAudioCalll,
                        const Color(0xFF039C00),
                        sz),
                    _commonContainer(context, 'Video', AppImages.profileVideo,
                        const Color(0xFFFFFFFF), sz),
                    InkWell(
                      onTap: () {
                        var newMember = UserModel(
                            email: "rasel@gmail.com",
                            name: "Rasel Ahmed",
                            profileImage: "",
                            role: "admin");
                        groupController.addMemberToGroup(groupId, newMember);
                      },
                      child: _commonContainer(context, 'Add',
                          AppImages.addImage, const Color(0xFFFF9900), sz),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _commonContainer(
    BuildContext context,
    String title,
    String assetName,
    Color color,
    sz,
  ) {
    return Container(
      height: sz.height * .06,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            assetName,
            width: sz.width * .04,
            color: color,
          ),
          SizedBox(
            width: sz.width * .02,
          ),
          Text(
            title,
            style: TextStyle(
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
