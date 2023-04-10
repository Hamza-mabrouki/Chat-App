import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scholor_chat_v2/fields/navBar.dart';
import 'package:scholor_chat_v2/widgets/const.dart';

import '../models/chatMessage.dart';

class ChatDetailPage extends StatefulWidget {
  ChatDetailPage();

  static String id = 'ChatDetailPage';
  @override
  _ChatDetailPage createState() {
    return _ChatDetailPage();
  }
}

class _ChatDetailPage extends State<ChatDetailPage> {
  String? message;
  String? user;
  bool messageType = true;
  TextEditingController controller = TextEditingController();
  CollectionReference messagedb =
      FirebaseFirestore.instance.collection('message');

  final ScrollController _scrollController = new ScrollController();

  Future<void> addmsg(String addmessage, bool messageTypereciversender) {
    return messagedb.add({
      'message': addmessage,
      'messageType': messageTypereciversender,
      'createdAt': DateTime.now()
    });
  }

  Future<void> clearTextField(String messageTextField, bool messageType) async {
    if (messageTextField != null && messageTextField.isNotEmpty) {
      message = controller.text;
      await addmsg(
        messageTextField,
        messageType,
      );
    }
    controller.clear();
    // _scrollController.animateTo(
    //   _scrollController.position.maxScrollExtent,
    //   duration: Duration(milliseconds: 500),
    //   curve: Curves.easeOut,
    // ); // Scroll to the bottom of the list
  }

  List<ChatMessage> messages = [
    // ChatMessage(
    //   messageContent: "Is there any thing wrong?",
    //   messageType: "sender",
    // ),
  ];

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: messagedb.orderBy('createdAt').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        // print("hna fin kat dakchi li bghiti tchof $_messageStream");
        if (snapshot.hasError) {
          print("${snapshot.hasError} Something went wrong");
          return Text("Something went wrong");
        }

        if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
          print("${snapshot.hasData}  ");
          //   return
          //   Text("Document does not exist");
          // }
          // print(snapshot.connectionState);
          // print(snapshot.data);
          // if (snapshot.connectionState == ConnectionState.active) {
          messages.clear();
          for (int x = 0; x < snapshot.data!.docs.length; x++) {
            messages.add(ChatMessage.fromJson(snapshot.data!.docs[x]));
          }

          return Scaffold(
            key: scaffoldKey,
            drawer: const NavBar(),
            appBar: AppBar(
              elevation: 0,
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              flexibleSpace: SafeArea(
                child: Container(
                  padding: const EdgeInsets.only(right: 16),
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      const CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/images/scholar.png"),
                        // backgroundImage: NetworkImage(
                        // "<https://randomuser.me/api/portraits/men/5.jpg>"),
                        maxRadius: 20,
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text(
                              "Hamza mabrouki",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                              "Online",
                              style: TextStyle(
                                  color: Colors.grey.shade600, fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          scaffoldKey.currentState?.openDrawer();
                        },
                        child: Builder(builder: (BuildContext context) {
                          return const Icon(
                            Icons.settings,
                            color: Colors.black54,
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage(kLogo),
                        )),
                      ),
                      ListView.builder(
                        itemCount: messages.length,
                        controller: _scrollController,
                        shrinkWrap: true,
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Container(
                            padding: const EdgeInsets.only(
                                left: 14, right: 14, top: 10, bottom: 10),
                            child: Align(
                              alignment: (messages[index].messageType == false
                                  ? Alignment.topLeft
                                  : Alignment.topRight),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: (messages[index].messageType == false
                                      ? Colors.grey.shade200
                                      : Colors.blue[200]),
                                ),
                                padding: const EdgeInsets.all(16),
                                child: Text(
                                  messages[index].messageContent,
                                  style: const TextStyle(fontSize: 15),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    padding:
                        const EdgeInsets.only(left: 10, bottom: 10, top: 10),
                    height: 60,
                    width: double.infinity,
                    color: Colors.white,
                    child: Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: controller,
                            onFieldSubmitted: (msg) {
                              message = msg;
                            },
                            decoration: const InputDecoration(
                                hintText: 'write message...',
                                hintStyle: TextStyle(color: Colors.black54),
                                border: InputBorder.none),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        FloatingActionButton(
                          onPressed: () {
                            clearTextField(controller.text, true);
                          },
                          backgroundColor: kPrimaryColor,
                          elevation: 0,
                          child: const Icon(
                            Icons.send,
                            color: Colors.white,
                            size: 18,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        } else
          return Text("somthing wroong");
      },
    );
  }
}
