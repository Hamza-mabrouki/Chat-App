import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scholor_chat_v2/widgets/costumbutton.dart';

import '../widgets/const.dart';
import '../widgets/costumbox.dart';
import 'chatPage.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  static String id = 'registerpage';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? email;
  String? full_name;
  String? messageText;
  String? passwd;

  bool isLoding = false;
  //Add new users when the user register
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> addUser() {
    // Call the user's CollectionReference to add a new user
    return users
        .add({
          'full_name': full_name, // hamza mab
          'messagetext': messageText, //
        })
        .then((value) => print("User Added"))
        .catchError((error) => ScaffoldMessenger.of(context)
            .showSnackBar((const SnackBar(content: Text("error ")))));
  }

  final GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoding,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Form(
          key: formkey,
          child: ListView(
            children: [
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/images/scholar.png',
                ),
              ),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'Scholar Chat',
                  style: TextStyle(
                    fontFamily: 'Pacifico',
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8),
                child: Align(
                  alignment: Alignment(-0.9, 0),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 33,
                    ),
                  ),
                ),
              ),
              EmailBox(
                  onChanged: (data) => full_name = data,
                  labeltext: 'full name',
                  hinttext: 'Enter full name',
                  hiding: false),
              EmailBox(
                onChanged: (data) => email = data,
                labeltext: 'Your email',
                hinttext: 'Enter your email',
                hiding: false,
              ),
              ReEmailBox(
                labeltext: 'Retype email',
                hinttext: 'Renter your email',
                hiding: false,
              ),
              PasswdBox(
                onChanged: (data) => passwd = data,
                labeltext: 'Your Password',
                hinttext: 'Enter your Password',
                hiding: true,
              ),
              RePasswdBox(
                labeltext: 'Retype Password',
                hinttext: 'Retype your Password',
                hiding: true,
              ),
              CostumButton(
                onTap: () async {
                  if (formkey.currentState!.validate()) {
                    isLoding = true;
                    setState(() {});
                    try {
                      await Register();

                      showmsg(context, 'Succes');
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-passord') {
                        showmsg(context, 'weak-passord');
                      } else if (e.code == 'email-already-in-use') {
                        showmsg(context,
                            'The account already exists for that email.');
                      }
                    } catch (e) {
                      showmsg(context, 'somthing wrong');

                      showmsg(context, e.toString());
                    }
                    isLoding = false;
                    setState(() {});
                    addUser();
                    Navigator.pushNamed(context, ChatPage.id);
                  } else {}
                },
                button: 'Sign up',
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Align(
                  alignment: const Alignment(1, 1),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          '''already have an account?''',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(0.1),
                        child: GestureDetector(
                          onTap: () =>
                              Navigator.pushNamed(context, 'loginpage'),
                          child: const Text(
                            '''Sign In''',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 23,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> Register() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: email.toString(), password: passwd.toString());
  }

  void showmsg(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }
}
