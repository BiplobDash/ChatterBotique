import 'dart:developer';
import 'package:chatter_botique/model/chat_room_model.dart';
import 'package:chatter_botique/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ContactController extends GetxController {
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  RxList<UserModel> userList = <UserModel>[].obs;
  RxList<ChatRoomModel> chatRoomList = <ChatRoomModel>[].obs;

  RxBool isLoading = false.obs;

  @override
  void onInit() async {
    await getUserList();
    await getChatRoomList();
    super.onInit();
  }

  Future<void> getUserList() async {
    isLoading.value = true;
    try {
      userList.clear();
      await db.collection('users').get().then((value) => {
            userList.value = value.docs
                .map(
                  (e) => UserModel.fromJson(
                    e.data(),
                  ),
                )
                .toList(),
          });
    } catch (e) {
      log(
        e.toString(),
      );
    }
    isLoading.value = false;
  }

  Future<void> getChatRoomList() async {
    List<ChatRoomModel> tempChatRoom = [];
    await db
        .collection('chats')
        .orderBy('timestamp', descending: true)
        .get()
        .then((value) {
      tempChatRoom = value.docs
          .map(
            (e) => ChatRoomModel.fromJson(
              e.data(),
            ),
          )
          .toList();
    });
    chatRoomList.value = tempChatRoom
        .where(
          (e) => e.id!.contains(auth.currentUser!.uid),
        )
        .toList();
  }

  Future<void> saveContact(UserModel user) async {
    try {
      await db
          .collection('users')
          .doc(auth.currentUser!.uid)
          .collection('contacts')
          .doc(user.id)
          .set(
            user.toJson(),
          );
    } catch (e) {
      log(e.toString());
    }
  }

  Stream<List<UserModel>> getContacts() {
    return db
        .collection('users')
        .doc(auth.currentUser!.uid)
        .collection('contacts')
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map(
                (e) => UserModel.fromJson(
                  e.data(),
                ),
              )
              .toList(),
        );
  }
}
