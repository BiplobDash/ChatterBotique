import 'package:flutter/material.dart';

myTabBar(TabController tabController, ThemeData theme) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(60),
    child: TabBar(
      controller: tabController,
      labelStyle: theme.textTheme.bodyLarge,
      unselectedLabelStyle: theme.textTheme.labelLarge,
      indicatorSize: TabBarIndicatorSize.label,
      indicatorWeight: 3,
      tabs: const [
        Text('Chats'),
        Text('Groups'),
        Text('Calls'),
      ],
    ),
  );
}
