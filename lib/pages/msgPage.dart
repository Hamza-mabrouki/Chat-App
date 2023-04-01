import 'package:flutter/material.dart';
import 'package:scholor_chat_v2/pages/convirsationList.dart';

import '../fields/navBar.dart';
import '../models/chatsersModel.dart';

class MsgsPage extends StatefulWidget {
  const MsgsPage({super.key});

  @override
  State<MsgsPage> createState() => _MsgsPageState();
}

class _MsgsPageState extends State<MsgsPage> {
  String? full_name;
  String? messageText;

  List<ChatUsers> chatUsers = [
    ChatUsers(
        full_name: 'hamza mabrouki',
        messageText: 'afin akhay ztek',
        imageURL:
            'assets/images/anonymous-user-circle-icon-vector-18958255.jpg',
        time: '10:11'),
    ChatUsers(
        full_name: 'hamza mabrouki',
        messageText: 'afin akhay ztek',
        imageURL:
            'assets/images/anonymous-user-circle-icon-vector-18958255.jpg',
        time: '10:11'),
    ChatUsers(
        full_name: 'hamza mabrouki',
        messageText: 'afin akhay ztek',
        imageURL:
            'assets/images/anonymous-user-circle-icon-vector-18958255.jpg',
        time: '10:11'),
    ChatUsers(
        full_name: 'hamza mabrouki',
        messageText: 'afin akhay ztek',
        imageURL:
            'assets/images/anonymous-user-circle-icon-vector-18958255.jpg',
        time: '10:11'),
    ChatUsers(
        full_name: 'hamza mabrouki',
        messageText: 'afin akhay ztek',
        imageURL:
            'assets/images/anonymous-user-circle-icon-vector-18958255.jpg',
        time: '10:11'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: 130,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: <Widget>[
                SafeArea(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text(
                          "Conversations",
                          style: TextStyle(
                              fontSize: 32, fontWeight: FontWeight.w600),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              left: 8, right: 8, top: 2, bottom: 2),
                          height: 35,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.pink[50]),
                          child: Row(children: <Widget>[
                            const Icon(
                              Icons.add,
                              color: Colors.pink,
                              size: 20,
                            ),
                            const SizedBox(width: 2),
                            GestureDetector(
                              onTap: () =>
                                  Navigator.pushNamed(context, NavBar.id),
                              child: const Text(
                                'Add New',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w400),
                              ),
                            ),
                          ]),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                  child: TextField(
                    autocorrect: true,
                    decoration: InputDecoration(
                        hintText: "Search ...",
                        hintStyle: TextStyle(
                          color: Colors.grey.shade600,
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.grey.shade600,
                          size: 20,
                        ),
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        contentPadding: const EdgeInsets.all(8),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                BorderSide(color: Colors.grey.shade100))),
                  ),
                ),
              ],
            ),
          ),
          ListView.builder(
              itemCount: chatUsers.length,
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 16),
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, i) {
                return ConvirsationList(
                  full_name: chatUsers[i].full_name,
                  messageText: chatUsers[i].messageText,
                  imageUrl: chatUsers[i].imageURL,
                  isMessageRead: (i == 0 || i == 3) ? true : false,
                  time: chatUsers[i].time,
                );
              }),
        ],
      ),
    );
  }
}
