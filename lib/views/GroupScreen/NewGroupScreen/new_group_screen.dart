import 'package:chatter_botique/controller/contact_controller.dart';
import 'package:chatter_botique/utils/exports.dart';
import 'package:chatter_botique/views/HomeScreen/Widgets/chat_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewGroupScreen extends StatelessWidget {
  const NewGroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ContactController contactController = Get.put(ContactController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Group"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.arrow_forward),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: StreamBuilder(
            stream: contactController.getContacts(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) {
                      return ChatTile(
                          imageUrl: snapshot.data![index].profileImage ??
                              AppImages.defaultProfileUrl,
                          name: snapshot.data![index].name!,
                          lastChat: snapshot.data![index].about ?? '',
                          lastTime: '',
                          onTap: () {});
                    });
              } else if (snapshot.hasError) {
                return Center(
                  child: Text("${snapshot.error}"),
                );
              } else {
                return const Center(
                  child: Text("No Contact Found"),
                );
              }
            }),
      ),
    );
  }
}
