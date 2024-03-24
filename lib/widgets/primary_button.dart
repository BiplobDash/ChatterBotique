import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String btnName;
  final IconData icon;
  final VoidCallback onTap;
  const PrimaryButton({
    super.key,
    required this.onTap, required this.btnName, required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final sz = MediaQuery.sizeOf(context);
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: theme.colorScheme.primary.withOpacity(.5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            SizedBox(
              width: sz.width * .02,
            ),
            Text(
              btnName,
              style: theme.textTheme.bodyLarge,
            )
          ],
        ),
      ),
    );
  }
}
