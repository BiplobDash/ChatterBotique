import 'package:chatter_botique/controller/call_controller.dart';
import 'package:chatter_botique/utils/exports.dart';
import 'package:chatter_botique/views/AuthScreen/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final CallController callController = Get.put(CallController());
    return GetMaterialApp(
      title: 'ChatterBotique',
      builder: FToastBuilder(),
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      getPages: pagePath,
      themeMode: ThemeMode.dark,
      home: const AuthScreen(),
    );
  }
}
