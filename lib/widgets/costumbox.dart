import 'package:flutter/material.dart';

class PasswdBox extends StatelessWidget {
  PasswdBox(
      {this.onChanged,
      required this.labeltext,
      required this.hinttext,
      required this.hiding,
      super.key});

  static String? passwd1;
  String labeltext;
  String hinttext;
  bool hiding;
  Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        validator: (value) {
          passwd1 = value;
          if (value!.isEmpty) return 'Field is Empty';
          return null;
        },
        keyboardType: TextInputType.emailAddress,
        onChanged: onChanged,
        style: const TextStyle(
          color: Colors.white,
        ),
        obscureText: hiding,
        decoration: InputDecoration(
            hintStyle: const TextStyle(color: Colors.white),
            labelStyle: const TextStyle(color: Colors.white),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            labelText: labeltext,
            hintText: hinttext),
      ),
    );
  }
}

class RePasswdBox extends StatelessWidget {
  RePasswdBox(
      {this.onChanged,
      required this.labeltext,
      required this.hinttext,
      required this.hiding,
      super.key});

  String labeltext;
  String hinttext;
  bool hiding;
  Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        validator: (value) {
          if (value != PasswdBox.passwd1) return 'not the same password';
          if (value!.isEmpty) return 'Field is Empty';

          return null;
        },
        keyboardType: TextInputType.visiblePassword,
        onChanged: onChanged,
        style: const TextStyle(
          color: Colors.white,
        ),
        obscureText: hiding,
        decoration: InputDecoration(
            hintStyle: const TextStyle(color: Colors.white),
            labelStyle: const TextStyle(color: Colors.white),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            labelText: labeltext,
            hintText: hinttext),
      ),
    );
  }
}

class EmailBox extends StatelessWidget {
  EmailBox(
      {this.onChanged,
      required this.labeltext,
      required this.hinttext,
      required this.hiding,
      super.key});
  static String? email1;

  String labeltext;
  String hinttext;
  bool hiding;
  Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        validator: (value) {
          email1 = value;
          if (value!.isEmpty) return 'Field is Empty';
          return null;
        },
        keyboardType: TextInputType.emailAddress,
        onChanged: onChanged,
        style: const TextStyle(
          color: Colors.white,
        ),
        obscureText: hiding,
        decoration: InputDecoration(
            hintStyle: const TextStyle(color: Colors.white),
            labelStyle: const TextStyle(color: Colors.white),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            labelText: labeltext,
            hintText: hinttext),
      ),
    );
  }
}

class ReEmailBox extends StatelessWidget {
  ReEmailBox(
      {required this.labeltext,
      required this.hinttext,
      required this.hiding,
      super.key});
  Function(String)? onChanged;
  String labeltext;
  String hinttext;
  bool hiding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
          validator: (value) {
            if (value != EmailBox.email1) return 'not the same email';

            if (value!.isEmpty) return 'Field is Empty';
            return null;
          },
          keyboardType: TextInputType.emailAddress,
          style: const TextStyle(
            color: Colors.white,
          ),
          obscureText: hiding,
          decoration: InputDecoration(
              hintStyle: const TextStyle(color: Colors.white),
              labelStyle: const TextStyle(color: Colors.white),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              labelText: labeltext,
              hintText: hinttext)),
    );
  }
}
