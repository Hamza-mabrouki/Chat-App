import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scholor_chat_v2/fields/navBar.dart';
import 'package:scholor_chat_v2/widgets/const.dart';

import '../models/chatMessage.dart';

class ChatDetailPage extends StatefulWidget {
  ChatDetailPage({super.key,});

  static String id = 'ChatDetailPage';
  @override
  _ChatDetailPage createState() {
    return _ChatDetailPage();
  }
}

class _ChatDetailPage extends State<ChatDetailPage> {
  String? message;
  String? user;
  TextEditingController controler = TextEditingController();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference messagedb =
      FirebaseFirestore.instance.collection('message');
  Future<void> addmsg() {
    return messagedb.add({'message': message, 'user': user});
  }

  List<ChatMessage> messages = [
    ChatMessage(messageContent: "Hello, Will", messageType: "receiver" ,user :"hamza"),
    ChatMessage(messageContent: "How have you been?", messageType: "receiver",user :"hamza"),
    ChatMessage(
        messageContent: "Hey Kriss, I am doing fine dude. wbu?",
        messageType: "sender",user :"hamza"),
    ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver",user :"hamza"),
    ChatMessage(
        messageContent: "Is there any thing wrong?", messageType: "sender",user :"hamza"),
    ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver",user :"hamza"),
    ChatMessage(
        messageContent: "Is there any thing wrong?", messageType: "sender",user :"hamza"),
    ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver",user :"hamza"),
    ChatMessage(
        messageContent: "Is there any thing wrong?", messageType: "sender",user :"hamza"),
    ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver",user :"hamza"),
    ChatMessage(
        messageContent: "Is there any thing wrong?", messageType: "sender",user :"hamza"),
    ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver",user :"hamza"),
    
    
    
  ];
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: messagedb.doc('AES8zK6ypDclEOViPCZ3').get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          print("${snapshot.hasError} Something went wrong");
          return Text("Something went wrong");
          
        }

        if (!snapshot.hasData ) {
          print ("${snapshot.hasData}  ");
          return Text("Document does not exist");
        }

      if (snapshot.connectionState == ConnectionState.done) {
        print('ff');
          // Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
          return  
          // Text("Full Name: ${data['message']} \t ${data['user ']}");


              Scaffold(
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
                        shrinkWrap: true,
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Container(
                            padding: const EdgeInsets.only(
                                left: 14, right: 14, top: 10, bottom: 10),
                            child: Align(
                              alignment:
                                  (messages[index].messageType == "receiver"
                                      ? Alignment.topLeft
                                      : Alignment.topRight),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color:
                                      (messages[index].messageType == "receiver"
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
                            controller: controler,
                            onFieldSubmitted: (msg) {
                              message = msg;
                              controler.clear();
                              print("check the message in the database");
                              addmsg();
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
                          onPressed: () {},
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
          return Text("Loading..");
      },
    );
  }
}
