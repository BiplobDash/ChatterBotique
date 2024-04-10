import 'dart:developer';

import 'package:chatter_botique/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ContactController extends GetxController {
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  RxList<UserModel> userList = <UserModel>[].obs;
  RxBool isLoading = false.obs;

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

  @override
  void onInit() {
    getUserList();
    super.onInit();
  }
}
