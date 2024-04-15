import 'package:flutter/material.dart';

class NewContactTile extends StatelessWidget {
  final String btnName;
  final IconData icon;
  final VoidCallback onTap;
  const NewContactTile({
    super.key,
    required this.btnName,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: theme.colorScheme.primaryContainer,
        ),
        child: Row(
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: theme.colorScheme.primary,
              ),
              child: Icon(
                icon,
                size: 30,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              btnName,
              style: theme.textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
