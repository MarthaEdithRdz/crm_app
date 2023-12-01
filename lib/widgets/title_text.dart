import 'package:flutter/material.dart';


class TitleText extends StatelessWidget {
  const TitleText({
    super.key, required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(text, style: TextStyle(
        fontSize: 27, 
        fontWeight: FontWeight.w500,
        color: Color(0xFF755DC1),)),
    );
  }
}