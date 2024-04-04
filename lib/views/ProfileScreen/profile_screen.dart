import 'package:chatter_botique/controller/profile_controller.dart';
import 'package:chatter_botique/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final ProfileController profileController = Get.put(
      ProfileController(),
    );
    RxBool isEdit = false.obs;
    TextEditingController nameController =
        TextEditingController(text: profileController.currentUser.value.name);
    TextEditingController emailController =
        TextEditingController(text: profileController.currentUser.value.email);
    TextEditingController phoneController = TextEditingController(
        text: profileController.currentUser.value.phoneNumber);
    TextEditingController aboutController =
        TextEditingController(text: profileController.currentUser.value.about);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: theme.colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor: theme.colorScheme.background,
                              radius: 80,
                              child: const Icon(Icons.image),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        _textField(
                            isEdit, nameController, 'Name', Icons.person),
                        _textField(
                            isEdit, aboutController, 'About', Icons.info),
                        _textField(false.obs, emailController, 'Email',
                            Icons.alternate_email_outlined),
                        _textField(
                            isEdit, phoneController, 'Number', Icons.phone),
                        const SizedBox(
                          height: 20,
                        ),
                        Obx(
                          () => isEdit.value
                              ? PrimaryButton(
                                  onTap: () {
                                    isEdit.value = false;
                                  },
                                  btnName: 'Save',
                                  icon: Icons.save,
                                )
                              : PrimaryButton(
                                  onTap: () {
                                    isEdit.value = true;
                                  },
                                  btnName: 'Edit',
                                  icon: Icons.edit,
                                ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _textField(RxBool isEdit, TextEditingController controller,
      String labelText, IconData icon) {
    return Column(
      children: [
        Obx(
          () => TextField(
            enabled: isEdit.value,
            controller: controller,
            decoration: InputDecoration(
              filled: isEdit.value,
              labelText: labelText,
              prefixIcon: Icon(
                icon,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
