import 'package:flutter/material.dart';
import 'package:scholor_chat_v2/pages/loginpage.dart';
import 'package:scholor_chat_v2/pages/msgPage.dart';
import 'package:scholor_chat_v2/widgets/const.dart';
import 'package:scholor_chat_v2/fields/navBar.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});
  static String id = 'ChatPage';

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    const MsgsPage(),
    const LoginPage(),
    const NavBar(),
  ];
  void _onItemTapped(int index) {
    setState(() {});
    _selectedIndex = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.grey.shade600,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
        type: BottomNavigationBarType.fixed,
        backgroundColor: kPrimaryColor,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.message), tooltip: 'Chat page ', label: 'chat '),
          BottomNavigationBarItem(
              icon: Icon(Icons.group_work),
              tooltip: 'Channels Page',
              label: 'Channels'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box),
              tooltip: 'Profile Page',
              label: 'Profile'),
        ],
      ),
    );
  }
}
