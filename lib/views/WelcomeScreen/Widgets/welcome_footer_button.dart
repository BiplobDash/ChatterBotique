import 'package:chatter_botique/utils/exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:slide_to_act/slide_to_act.dart';

class WelcomeFooterButton extends StatelessWidget {
  const WelcomeFooterButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SlideAction(
      height: 60,
      onSubmit: () {
        return null;
      },
      sliderButtonIconSize: 15,
      text: AppStrings.slideToStart,
      textStyle: theme.textTheme.labelLarge,
      sliderButtonIcon: SizedBox(
        width: 20,
        height: 20,
        child: SvgPicture.asset(
          AppImages.plugImage,
          width: 20,
        ),
      ),
      submittedIcon: SizedBox(
        width: 20,
        height: 20,
        child: SvgPicture.asset(
          AppImages.connectImage,
          width: 20,
        ),
      ),
      innerColor: theme.colorScheme.primary,
      outerColor: theme.colorScheme.primaryContainer,
    );
  }
}
