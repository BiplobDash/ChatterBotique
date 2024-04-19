import 'dart:developer';
import 'package:chatter_botique/controller/profile_controller.dart';
import 'package:chatter_botique/model/user_model.dart';
import 'package:chatter_botique/views/HomeScreen/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class GroupController extends GetxController {
  RxList<UserModel> groupMembers = <UserModel>[].obs;
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  RxBool isLoading = false.obs;
  var uuid = const Uuid();

  final ProfileController profileController = Get.put(ProfileController());
  void selectMember(UserModel userModel) async {
    if (groupMembers.contains(userModel)) {
      groupMembers.remove(userModel);
    } else {
      groupMembers.add(userModel);
    }
  }

  Future<void> createGroup(String groupName, String groupImage) async {
    isLoading.value = true;
    try {
      String groupId = uuid.v6();
      String imageUrl =
          await profileController.uploadFileToFirebase(groupImage);
      await db.collection('groups').doc(groupId).set({
        "id": groupId,
        "name": groupName,
        "profileUrl": imageUrl,
        "members": groupMembers.map((e) => e.toJson()).toList(),
        "createdAt": DateTime.now().toString(),
        "createdBy": auth.currentUser!.uid,
        "timeStamp": DateTime.now().toString(),
      });
      Get.snackbar("Group created", "Group Created Successfully");
      isLoading.value = false;
      Get.offAll(() => const HomeScreen());
    } catch (e) {
      log(e.toString());
    }
  }
}
