import 'package:chatter_botique/utils/exports.dart';
import 'package:flutter/material.dart';

class WelcomeHeading extends StatelessWidget {
  const WelcomeHeading({super.key});

  @override
  Widget build(BuildContext context) {
    final sz = MediaQuery.sizeOf(context);
    final theme = Theme.of(context);
    return Column(
      children: [
        Image.asset(
          AppImages.logoImage,
          width: sz.width * .9,
          height: sz.height * .15,
          color: theme.colorScheme.onBackground,
        ),
        SizedBox(
          height: sz.height * .02,
        ),
        Text(
          AppStrings.appName,
          style: theme.textTheme.headlineLarge!.copyWith(
            color: theme.colorScheme.secondary,
          ),
        ),
      ],
    );
  }
}
