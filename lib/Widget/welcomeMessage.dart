import 'package:flutter/material.dart';
import 'package:white_coin/resources/constant.dart';

class WelcomeMessage extends StatelessWidget {

  final String text1;
  final String text2;

  WelcomeMessage({this.text1, this.text2});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text1,
          style: TextStyle(
            color: Colors.black,
            fontSize: 32,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          text2,
          style: TextStyle(
            color: KSecondColor,
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
