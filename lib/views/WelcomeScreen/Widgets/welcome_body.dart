import 'package:chatter_botique/utils/exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomeBodyScreen extends StatelessWidget {
  const WelcomeBodyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sz = MediaQuery.sizeOf(context);
    final theme = Theme.of(context);
    return Column(
      children: [
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
          height: sz.height * .02,
        ),
        Text(
          AppStrings.nowYouAre,
          style: theme.textTheme.headlineMedium,
        ),
        Text(
          AppStrings.connected,
          style: theme.textTheme.headlineLarge,
        ),
        SizedBox(
          height: sz.height * .015,
        ),
        Text(
          AppStrings.welcomePageDescription,
          textAlign: TextAlign.center,
          style: theme.textTheme.labelLarge,
        )
      ],
    );
  }
}
