import 'package:chatter_botique/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;

  Rx<UserModel> currentUser = UserModel().obs;

  Future<void> getUserDetails() async {
    await db.collection('users').doc(auth.currentUser!.uid).get().then((value) {
      currentUser.value = UserModel.fromJson(value.data()!);
    });
  }

  @override
  void onInit() async{
    await getUserDetails();
    super.onInit();
  }
}
