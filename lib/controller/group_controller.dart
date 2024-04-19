import 'dart:developer';
import 'package:chatter_botique/controller/profile_controller.dart';
import 'package:chatter_botique/model/chat_model.dart';
import 'package:chatter_botique/model/groud_model.dart';
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
  RxString selectedImagePath = "".obs;
  RxList<GroupModelUser> groupList = <GroupModelUser>[].obs;

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
    groupMembers.add(UserModel(
      id: auth.currentUser!.uid,
      name: profileController.currentUser.value.name,
      profileImage: profileController.currentUser.value.profileImage,
      email: profileController.currentUser.value.email,
      role: "admin",
    ));
    String groupId = uuid.v6();
    try {
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

  Future<void> getGroups() async {
    isLoading.value = true;
    List<GroupModelUser> tempGroup = [];
    await db.collection('groups').get().then((value) => {
          tempGroup = value.docs
              .map(
                (e) => GroupModelUser.fromJson(
                  e.data(),
                ),
              )
              .toList()
        });
    groupList.clear();
    groupList.value = tempGroup
        .where(
          (e) =>
              e.members!.any((element) => element.id == auth.currentUser!.uid),
        )
        .toList();
    isLoading.value = false;
  }

  Future<void> sendGroupMessage(
      String message, String groupId, String imagePath) async {
    var chatId = uuid.v6();
    String imageUrl = "";
    if (selectedImagePath.value.isNotEmpty) {
      imageUrl =
          await profileController.uploadFileToFirebase(selectedImagePath.value);
    }
    var newChat = ChatModel(
      id: chatId,
      message: message,
      senderId: auth.currentUser!.uid,
      imageUrl: imageUrl,
      senderName: profileController.currentUser.value.name,
      timestamp: DateTime.now().toString(),
    );
    await db
        .collection("groups")
        .doc(groupId)
        .collection("messages")
        .doc(chatId)
        .set(
          newChat.toJson(),
        );
  }

  Stream<List<ChatModel>> getGroupMessages(String groupId) {
    return db
        .collection("groups")
        .doc(groupId)
        .collection("messages")
        .orderBy("timestamp", descending: true)
        .snapshots()
        .map(
          (snapshots) => snapshots.docs
              .map(
                (e) => ChatModel.fromJson(
                  e.data(),
                ),
              )
              .toList(),
        );
  }

  @override
  void onInit() {
    getGroups();
    super.onInit();
  }
}
