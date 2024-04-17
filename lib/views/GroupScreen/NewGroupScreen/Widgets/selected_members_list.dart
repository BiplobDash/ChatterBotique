import 'package:cached_network_image/cached_network_image.dart';
import 'package:chatter_botique/controller/group_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/exports.dart';

class SelectedMembers extends StatelessWidget {
  const SelectedMembers({super.key});

  @override
  Widget build(BuildContext context) {
    final GroupController groupController = Get.put(GroupController());
    return Obx(
      () => Row(
        children: groupController.groupMembers
            .map(
              (e) => Stack(
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    margin: const EdgeInsets.all(10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: CachedNetworkImage(
                        imageUrl: e.profileImage ?? AppImages.defaultProfileUrl,
                        fit: BoxFit.cover,
                        width: 55,
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: InkWell(
                      onTap: () {
                        groupController.groupMembers.remove(e);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: const Icon(
                          Icons.close,
                          size: 15,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}
