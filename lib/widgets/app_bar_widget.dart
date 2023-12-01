import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String text;

  @override
  Size get preferredSize => const Size.fromHeight(55);

  const AppBarWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(50.0),
      child: AppBar(
        leading: const Icon(
          Icons.person,
          size: 32,
          color: Colors.white,
        ),
        backgroundColor: const Color(0xFF9F7BFF),
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 00, left: 0),
              child: Image.asset(
                width: 120,
                height: 100,
                'assets/images/crm.jpeg',
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 7, left: 15),
              child: Text(
                text,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 24),
              ),
            )
          ],
        ),
      ),
    );
  }
}