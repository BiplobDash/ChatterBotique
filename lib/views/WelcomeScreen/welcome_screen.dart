import 'package:flutter/material.dart';
import 'Widgets/welcome_body.dart';
import 'Widgets/welcome_footer_button.dart';
import 'Widgets/welcome_heading.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            WelcomeHeading(),
            WelcomeBodyScreen(),
            WelcomeFooterButton(),
          ],
        ),
      )),
    );
  }
}
