import 'dart:developer';
import 'package:chatter_botique/controller/contact_controller.dart';
import 'package:chatter_botique/controller/profile_controller.dart';
import 'package:chatter_botique/model/chat_model.dart';
import 'package:chatter_botique/model/chat_room_model.dart';
import 'package:chatter_botique/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class ChatController extends GetxController {
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  RxBool isLoading = false.obs;
  var uuid = const Uuid();
  RxString selectedImagePath = "".obs;
  final ProfileController profileController = Get.put(ProfileController());
  final ContactController contactController = Get.put(ContactController());

  String getRoomId(String targetUserId) {
    String currentUserId = auth.currentUser!.uid;
    if (currentUserId[0].codeUnitAt(0) > targetUserId[0].codeUnitAt(0)) {
      return currentUserId + targetUserId;
    } else {
      return targetUserId + currentUserId;
    }
  }

  UserModel getSender(UserModel currentUser, UserModel targetUser) {
    String currentUserId = currentUser.id!;
    String targetUserId = targetUser.id!;
    if (currentUserId[0].codeUnitAt(0) > targetUserId[0].codeUnitAt(0)) {
      return currentUser;
    } else {
      return targetUser;
    }
  }

  UserModel getReceiver(UserModel currentUser, UserModel targetUser) {
    String currentUserId = currentUser.id!;
    String targetUserId = targetUser.id!;
    if (currentUserId[0].codeUnitAt(0) > targetUserId[0].codeUnitAt(0)) {
      return targetUser;
    } else {
      return currentUser;
    }
  }

  Future<void> sendMessage(
      String targetUserId, String message, UserModel targetUser) async {
    isLoading.value = true;
    String chatId = uuid.v6();
    String roomId = getRoomId(targetUserId);
    DateTime timeStamp = DateTime.now();
    String nowTime = DateFormat('hh:mm a').format(timeStamp);
    UserModel sender =
        getSender(profileController.currentUser.value, targetUser);
    UserModel receiver =
        getReceiver(profileController.currentUser.value, targetUser);
    RxString imageUrl = ''.obs;
    if (selectedImagePath.value.isNotEmpty) {
      imageUrl.value =
          await profileController.uploadFileToFirebase(selectedImagePath.value);
    }
    var newChat = ChatModel(
      id: chatId,
      message: message,
      senderId: auth.currentUser!.uid,
      imageUrl: imageUrl.value,
      receiverId: targetUserId,
      senderName: profileController.currentUser.value.name,
      timestamp: DateTime.now().toString(),
    );

    var roomDetails = ChatRoomModel(
      id: roomId,
      lastMessage: message,
      lastMessageTimeStamp: nowTime,
      sender: sender,
      receiver: receiver,
      timestamp: DateTime.now().toString(),
      unReadMessNo: 0,
    );

    try {
      await db
          .collection('chats')
          .doc(roomId)
          .collection('messages')
          .doc(chatId)
          .set(
            newChat.toJson(),
          );
      selectedImagePath.value = '';
      await db.collection('chats').doc(roomId).set(
            roomDetails.toJson(),
          );
      await db
          .collection('users')
          .doc(auth.currentUser!.uid)
          .collection('contacts')
          .doc(targetUser.id)
          .set(
            targetUser.toJson(),
          );
    } catch (e) {
      log(
        e.toString(),
      );
    }
    isLoading.value = false;
  }

  Stream<List<ChatModel>> getMessage(String targetUserId) {
    String roomId = getRoomId(targetUserId);
    return db
        .collection('chats')
        .doc(roomId)
        .collection('messages')
        .orderBy("timestamp", descending: true)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map(
                (e) => ChatModel.fromJson(
                  e.data(),
                ),
              )
              .toList(),
        );
  }

}
