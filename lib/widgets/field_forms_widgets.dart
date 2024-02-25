import 'package:firebaseappc2/constants/constants.dart';
import 'package:flutter/material.dart';

class FieldFormWidget extends StatelessWidget {
  String text;
  TextEditingController controller;

  FieldFormWidget({
    required this.text,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(
          height: 8,
        ),
        Container(
          height: 60,
          child: TextField(
            controller: controller,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white.withOpacity(0.08),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              focusedBorder: borderFormStyle,
              enabledBorder: borderFormStyle,
            ),
          ),
        )
      ],
    );
  }
}
