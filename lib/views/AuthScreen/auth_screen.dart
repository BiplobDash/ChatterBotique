import 'package:flutter/material.dart';
import '../WelcomeScreen/Widgets/welcome_heading.dart';
import 'Widgets/auth_screen_body.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sz = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                const WelcomeHeading(),
                SizedBox(
                  height: sz.height * .04,
                ),
                const AuthScreenBody()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
