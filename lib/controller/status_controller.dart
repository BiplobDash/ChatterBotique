import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StatusController extends GetxController with WidgetsBindingObserver {
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  @override
  void onInit() async {
    WidgetsBinding.instance.addObserver(this);
    await db
        .collection("users")
        .doc(auth.currentUser!.uid)
        .update({"status": "Online"});
    super.onInit();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.inactive) {
      print(state);
      await db
          .collection("users")
          .doc(auth.currentUser!.uid)
          .update({"status": "Offline"});
    } else if (state == AppLifecycleState.resumed) {
      print(state);
      await db
          .collection("users")
          .doc(auth.currentUser!.uid)
          .update({"status": "Online"});
    }

    super.didChangeAppLifecycleState(state);
  }

  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);
    super.onClose();
  }
}
