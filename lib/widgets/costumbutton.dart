import 'package:flutter/material.dart';

class CostumButton extends StatelessWidget {
  CostumButton({super.key, this.onTap, required this.button});
  String button;
  VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        height: 40,
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            color: Colors.blue,
            child: Text(button),
          ),
        ),
      ),
    );
  }
}
