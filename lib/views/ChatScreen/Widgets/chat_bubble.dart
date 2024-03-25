import 'package:chatter_botique/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isComming;
  final String time;
  final String status;
  final String imageUrl;
  const ChatBubble({
    super.key,
    required this.message,
    required this.isComming,
    required this.time,
    required this.status,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final sz = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 20,
      ),
      child: Column(
        crossAxisAlignment:
            isComming ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            constraints: BoxConstraints(
              maxWidth: sz.width / 1.3,
            ),
            decoration: BoxDecoration(
              color: theme.colorScheme.primaryContainer,
              borderRadius: isComming
                  ? const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    )
                  : const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
            ),
            child: imageUrl == ''
                ? Text(message)
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(imageUrl)),
                      SizedBox(
                        height: sz.height * .01,
                      ),
                      Text(message),
                    ],
                  ),
          ),
          SizedBox(
            height: sz.height * .01,
          ),
          Row(
            mainAxisAlignment:
                isComming ? MainAxisAlignment.start : MainAxisAlignment.end,
            children: [
              isComming
                  ? Text(
                      time,
                      style: theme.textTheme.labelMedium,
                    )
                  : Row(
                      children: [
                        Text(
                          time,
                          style: theme.textTheme.labelMedium,
                        ),
                        SizedBox(
                          width: sz.width * .01,
                        ),
                        SvgPicture.asset(
                          AppImages.statusImage,
                          width: sz.width * .045,
                        ),
                      ],
                    ),
            ],
          ),
        ],
      ),
    );
  }
}
