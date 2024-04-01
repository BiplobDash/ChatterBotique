import 'package:chatter_botique/utils/exports.dart';
import 'package:chatter_botique/views/HomeScreen/Widgets/chats_list.dart';
import 'package:chatter_botique/views/HomeScreen/Widgets/tabbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // final sz = MediaQuery.sizeOf(context);
    TabController tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            AppImages.logoImage,
          ),
        ),
        title: Text(
          AppStrings.appName,
          style: theme.textTheme.headlineSmall,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              Get.toNamed("/profile-screen");
            },
            icon: const Icon(Icons.more_vert_sharp),
          ),
        ],
        bottom: myTabBar(tabController, theme),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: theme.colorScheme.primary,
        child: Icon(
          Icons.add,
          color: theme.colorScheme.onBackground,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: TabBarView(controller: tabController, children: [
          const ChatList(),
          ListView(
            children: const [
              ListTile(),
            ],
          ),
          ListView(
            children: const [
              ListTile(),
            ],
          ),
        ]),
      ),
    );
  }
}
