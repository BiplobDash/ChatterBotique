import 'package:chatter_botique/controller/auth_controller.dart';
import 'package:chatter_botique/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final sz = MediaQuery.sizeOf(context);
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
    final AuthController authController = Get.put(
      AuthController(),
    );
    return Column(
      children: [
        SizedBox(
          height: sz.height * .02,
        ),
        TextField(
          controller: nameController,
          decoration: const InputDecoration(
            hintText: 'Full Name',
            prefixIcon: Icon(
              Icons.person,
            ),
          ),
        ),
        SizedBox(
          height: sz.height * .02,
        ),
        TextField(
          controller: emailController,
          decoration: const InputDecoration(
            hintText: 'E-mail',
            prefixIcon: Icon(
              Icons.alternate_email_outlined,
            ),
          ),
        ),
        SizedBox(
          height: sz.height * .02,
        ),
        TextField(
          controller: passController,
          decoration: const InputDecoration(
            hintText: 'Password',
            prefixIcon: Icon(
              Icons.password_outlined,
            ),
          ),
        ),
        SizedBox(
          height: sz.height * .05,
        ),
        Obx(
          () => authController.isLoading.value
              ? const CircularProgressIndicator()
              : PrimaryButton(
                  onTap: () {
                    authController.userCreate(
                      emailController.text,
                      passController.text,
                    );
                  },
                  btnName: 'SIGNUP',
                  icon: Icons.lock_outline_rounded,
                ),
        ),
      ],
    );
  }
}
