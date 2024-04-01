import 'package:chatter_botique/utils/exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginUserInfo extends StatelessWidget {
  const LoginUserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final sz = MediaQuery.sizeOf(context);
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppImages.boyImage,
                    ),
                  ],
                ),
                SizedBox(
                  height: sz.height * .02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Jhon Sins',
                      style: theme.textTheme.bodyLarge,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'jhon@gmail.com',
                      style: theme.textTheme.labelLarge,
                    ),
                  ],
                ),
                SizedBox(
                  height: sz.height * .02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _commonContainer(
                        context,
                        'Call',
                        AppImages.profileAudioCalll,
                        const Color(0xFF039C00),
                        sz),
                    _commonContainer(context, 'Video', AppImages.profileVideo,
                        const Color(0xFFFFFFFF), sz),
                    _commonContainer(context, 'Message',
                        AppImages.profileMessage, const Color(0xFFFF9900), sz),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _commonContainer(
    BuildContext context,
    String title,
    String assetName,
    Color color,
    sz,
  ) {
    return Container(
      height: sz.height * .06,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            assetName,
            width: sz.width * .04,
          ),
          SizedBox(
            width: sz.width * .02,
          ),
          Text(
            title,
            style: TextStyle(
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
