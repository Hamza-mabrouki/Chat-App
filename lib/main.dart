import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:scholor_chat_v2/fields/navBar.dart';
import 'package:scholor_chat_v2/pages/chatDetailPage.dart';
import 'package:scholor_chat_v2/pages/chatPage.dart';
import 'package:scholor_chat_v2/pages/loginpage.dart';
import 'package:scholor_chat_v2/pages/registerpage.dart';

import 'firebase_options.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        LoginPage.id: (context) => const LoginPage(),
        RegisterPage.id: (context) => const RegisterPage(),
        ChatPage.id: (context) => const ChatPage(),
        ChatDetailPage.id: (context) => const ChatDetailPage(),
        NavBar.id: (context) => const NavBar(),
      },
      initialRoute: LoginPage.id,
    );
  }
}
