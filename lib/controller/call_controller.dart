import 'dart:developer';

import 'package:chatter_botique/model/audio_call_model.dart';
import 'package:chatter_botique/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class CallController extends GetxController {
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  final uuid = const Uuid();

  Future<void> callAction(UserModel receiver, UserModel caller) async {
    String id = uuid.v4();
    var newCall = AudioCallModel(
        id: id,
        callerName: caller.name,
        callerEmail: caller.email,
        callerPic: caller.profileImage,
        callerUid: caller.id,
        receiverName: receiver.name,
        receiverEmail: receiver.email,
        receiverPic: receiver.profileImage,
        receiverUid: receiver.id,
        status: "dialing");
    try {
      await db
          .collection("notification")
          .doc(receiver.id)
          .collection('call')
          .doc(id)
          .set(
            newCall.toJson(),
          );
      await db
          .collection("users")
          .doc(auth.currentUser!.uid)
          .collection("calls")
          .doc(id)
          .set(
            newCall.toJson(),
          );
      await db
          .collection("users")
          .doc(receiver.id)
          .collection("calls")
          .doc(id)
          .set(
            newCall.toJson(),
          );
      Future.delayed(const Duration(minutes: 1), () {
        endCall(newCall);
      });
    } catch (e) {
      log(e.toString());
    }
  }

  Stream<QuerySnapshot> getCallsNotification() {
    return db
        .collection('notification')
        .doc(auth.currentUser!.uid)
        .collection('call')
        .snapshots();
  }

  Future<void> endCall(AudioCallModel call) async {
    try {
      await db
          .collection("notification")
          .doc(call.receiverUid)
          .collection("call")
          .doc(call.id)
          .delete();
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  void onInit() {
    getCallsNotification().listen((snapshot) {
      if (snapshot.docs.isNotEmpty) {
        Get.snackbar("Calling", "Calling");
      }
    });
    super.onInit();
  }
}
