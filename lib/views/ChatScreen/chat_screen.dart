import 'package:chatter_botique/utils/exports.dart';
import 'package:chatter_botique/views/ChatScreen/Widgets/chat_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final sz = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Image.asset(AppImages.boyImage),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Harry Jansen',
              style: theme.textTheme.bodyLarge,
            ),
            Text(
              'Online',
              style: theme.textTheme.labelSmall,
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.phone),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.video_call),
          ),
        ],
      ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: sz.height * .089,
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: theme.colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          children: [
            SvgPicture.asset(AppImages.micImage,width: sz.width * .08,),
            SizedBox(width: sz.width * .01,),
            const Expanded(child: TextField(
              decoration: InputDecoration(filled: false,hintText: 'Type message ....'),
            ),),
             SizedBox(width: sz.width * .01,),
            SvgPicture.asset(AppImages.gallaryImage, width: sz.width * .08,),
             SizedBox(width: sz.width * .01,),
            SvgPicture.asset(AppImages.sendImage, width: sz.width * .08,),
          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: const [
            ChatBubble(message: "hfjihfksdhfdskh", isComming: true, time: "10:00 AM", status: "read", imageUrl: ''),
            ChatBubble(message: "hfjihfksdhfdskh", isComming: false, time: "10:00 AM", status: "read", imageUrl: 'https://www.mindinventory.com/blog/wp-content/uploads/2022/10/flutter-3.png'),
            ChatBubble(message: "hfjihfksdhfdskh", isComming: true, time: "10:00 AM", status: "read", imageUrl: 'https://www.mindinventory.com/blog/wp-content/uploads/2022/10/flutter-3.png'),
            ChatBubble(message: "hfjihfksdhfdskh", isComming: false, time: "10:00 AM", status: "read", imageUrl: 'https://www.mindinventory.com/blog/wp-content/uploads/2022/10/flutter-3.png'),
          ],
        ),
      ),
    );
  }
}
