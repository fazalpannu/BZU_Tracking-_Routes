import 'package:flutter/material.dart';

class button extends StatelessWidget {
  String txt;
  VoidCallback ontap;
  button({super.key, required this.txt, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: const Color(0xFF1E232C),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      onPressed: ontap,
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Text(
          txt,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
