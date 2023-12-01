import 'package:flutter/material.dart';

class MainImage extends StatelessWidget {
  const MainImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
      "assets/images/login.jpeg",
      width: 413,
      height: 250,
     ),
    );
  }
}