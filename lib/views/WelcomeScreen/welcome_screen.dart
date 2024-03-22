import 'package:chatter_botique/utils/exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'Widgets/welcome_heading.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sz = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              height: sz.height * .05,
            ),
            const WelcomeHeading(),
            SizedBox(
              height: sz.height * .05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppImages.boyImage,
                ),
                SvgPicture.asset(
                  AppImages.connectImage,
                ),
                Image.asset(
                  AppImages.girlImage,
                ),
              ],
            ),
            SizedBox(
              height: sz.height * .03,
            ),
            const Text(AppStrings.nowYouAre)
          ],
        ),
      )),
    );
  }
}
