import 'package:chatter_botique/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final sz = MediaQuery.sizeOf(context);
    return Column(
      children: [
         SizedBox(
          height: sz.height * .02,
        ),
        const TextField(
          decoration: InputDecoration(
            hintText: 'Full Name',
            prefixIcon: Icon(
              Icons.person,
            ),
          ),
        ),
        SizedBox(
          height: sz.height * .02,
        ),
        const TextField(
          decoration: InputDecoration(
            hintText: 'E-mail',
            prefixIcon: Icon(
              Icons.alternate_email_outlined,
            ),
          ),
        ),
        SizedBox(
          height: sz.height * .02,
        ),
        const TextField(
          decoration: InputDecoration(
            hintText: 'Password',
            prefixIcon: Icon(
              Icons.password_outlined,
            ),
          ),
        ),
        SizedBox(
          height: sz.height * .05,
        ),
        PrimaryButton(
          onTap: () {},
          btnName: 'SIGNUP',
          icon: Icons.lock_outline_rounded,
        ),
      ],
    );
  }
}
