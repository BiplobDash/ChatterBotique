import 'package:flutter/material.dart';

class ChatTile extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String lastChat;
  final String lastTime;
  final VoidCallback onTap;
  const ChatTile({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.lastChat,
    required this.lastTime,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final sz = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: theme.colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  imageUrl,
                  width: 55,
                ),
                SizedBox(
                  width: sz.width * .02,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: theme.textTheme.bodyLarge,
                    ),
                    SizedBox(
                      height: sz.height * .001,
                    ),
                    Text(
                      lastChat,
                      style: theme.textTheme.labelMedium,
                    ),
                  ],
                ),
              ],
            ),
            Text(
              lastTime,
              style: theme.textTheme.labelMedium,
            ),
          ],
        ),
      ),
    );
  }
}
