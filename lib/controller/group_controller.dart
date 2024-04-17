import 'package:chatter_botique/model/user_model.dart';
import 'package:get/get.dart';

class GroupController extends GetxController {
  RxList<UserModel> groupMembers = <UserModel>[].obs;

  void selectMember(UserModel userModel) async {
    if (groupMembers.contains(userModel)) {
      groupMembers.remove(userModel);
    } else {
      groupMembers.add(userModel);
    }
  }
}
