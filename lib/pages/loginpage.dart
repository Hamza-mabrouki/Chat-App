import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scholor_chat_v2/pages/chatPage.dart';
import 'package:scholor_chat_v2/pages/registerpage.dart';
import 'package:scholor_chat_v2/widgets/const.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static String id = 'loginpage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? email;
  String? passwd;
  bool isLoading = false;
  GlobalKey<FormState> formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        appBar: null,
        body: Form(
          key: formkey,
          child: SingleChildScrollView(
            reverse: true,
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
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
                      'Sign In',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 33,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) return 'Field is Empty';

                      return null;
                    },
                    onChanged: (value) {
                      email = value;
                    },
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                        hintStyle: TextStyle(color: Colors.white),
                        labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        labelText: 'Your email',
                        hintText: 'Enter your email'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) return 'Field is Empty';
                      return null;
                    },
                    onChanged: (value) {
                      passwd = value;
                    },
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    obscureText: true,
                    decoration: const InputDecoration(
                        hintStyle: TextStyle(color: Colors.white),
                        labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        labelText: 'Your Password',
                        hintText: 'Enter your Password'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: SizedBox(
                    width: double.infinity,
                    height: 40,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.blue,
                      ),
                      onPressed: () async {
                        if (formkey.currentState!.validate()) {
                          try {
                            isLoading = true;
                            setState(() {});
                            UserCredential user = await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: email!, password: passwd!);

                            Navigator.pushNamed(context, ChatPage.id);
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                              Showmsg(context, 'User is not found');
                            } else if (e.code == 'wrong-password') {
                              Showmsg(context, 'Wrong Password');
                            }
                          } catch (e) {
                            print(e);
                            Showmsg(context, 'error accure');
                          }
                          isLoading = false;
                          setState(() {});
                        } else {}
                      },
                      child: const Text('Sign in'),
                    ),
                  ),
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
                            '''I don't have an account?''',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(0.1),
                          child: GestureDetector(
                            onTap: () =>
                                Navigator.pushNamed(context, RegisterPage.id),
                            child: const Text(
                              '''Sign Up''',
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
      ),
    );
  }

  void Showmsg(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }
}
