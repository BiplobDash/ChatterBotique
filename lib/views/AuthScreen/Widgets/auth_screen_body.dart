import 'package:chatter_botique/utils/exports.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_form.dart';
import 'signup_form.dart';

class AuthScreenBody extends StatelessWidget {
  const AuthScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final sz = MediaQuery.sizeOf(context);
    final theme = Theme.of(context);
    RxBool isLogin = true.obs;

    return Container(
      // height: sz.height * .4,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          isLogin.value = true;
                        },
                        child: SizedBox(
                          width: sz.width / 2.6,
                          child: Column(
                            children: [
                              Text(
                                AppStrings.login,
                                style: isLogin.value
                                    ? theme.textTheme.bodyLarge
                                    : theme.textTheme.labelLarge,
                              ),
                              SizedBox(
                                height: sz.height * .006,
                              ),
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 150),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: theme.colorScheme.primary,
                                ),
                                width: isLogin.value ? sz.width * .25 : 0,
                                height: sz.height * .0065,
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          isLogin.value = false;
                        },
                        child: SizedBox(
                          width: sz.width / 2.6,
                          child: Column(
                            children: [
                              Text(
                                AppStrings.signup,
                                style: isLogin.value
                                    ? theme.textTheme.labelLarge
                                    : theme.textTheme.bodyLarge,
                              ),
                              SizedBox(
                                height: sz.height * .006,
                              ),
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 150),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: theme.colorScheme.primary,
                                ),
                                width: isLogin.value ? 0 : sz.width * .25,
                                height: sz.height * .0065,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Obx(
                  () => isLogin.value ? const LoginForm() : const SignupForm(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
