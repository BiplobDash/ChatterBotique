import 'dart:developer';
import 'dart:io';

import 'package:chatter_botique/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  final store = FirebaseStorage.instance;

  RxBool isLoading = false.obs;
  Rx<UserModel> currentUser = UserModel().obs;

  Future<void> getUserDetails() async {
    await db.collection('users').doc(auth.currentUser!.uid).get().then((value) {
      currentUser.value = UserModel.fromJson(value.data()!);
    });
  }

  Future<void> updateProfile(
    String imageUrl,
    String name,
    String about,
    String number,
  ) async {
    isLoading.value = true;
    try {
      final imageLink = await uploadFileToFirebase(
        imageUrl,
      );
      final updateUser = UserModel(
        name: name,
        about: about,
        phoneNumber: number,
        profileImage: imageLink,
      );
      await db.collection('users').doc(auth.currentUser!.uid).set(
            updateUser.toJson(),
          );
    } catch (e) {
      log(
        e.toString(),
      );
    }
    isLoading.value = false;
  }

  Future<String> uploadFileToFirebase(String imagePath) async {
    final path = "files/$imagePath";
    final file = File(imagePath);
    if (imagePath != "" && imagePath.isNotEmpty) {
      try {
        final ref = store.ref().child(path).putFile(file);
        final uploadTask = await ref.whenComplete(() {});
        final downloadImageUrl = await uploadTask.ref.getDownloadURL();
        return downloadImageUrl;
      } catch (e) {
        log(e.toString());
        return "";
      }
    }
    return "";
  }

  @override
  void onInit() async {
    await getUserDetails();
    super.onInit();
  }
}
