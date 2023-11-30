import 'package:flutter/material.dart';

class TextFieldMain extends StatelessWidget {
  const TextFieldMain({
    super.key,
    required TextEditingController textController,
    required this.labelText,
    required this.icon,
  }) : _emailController = textController;

  final TextEditingController _emailController;
  final String labelText;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _emailController,
      textAlign: TextAlign.justify,
      style: const TextStyle(
        color: Color(0xFF393939),
        fontSize: 15,
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(icon),
        prefixIconColor: Color(0xFF9F7BFF),
        labelStyle: const TextStyle(
          color: Color(0xFF755DC1),
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            width: 1,
            color: Color(0xFF837E93),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            width: 1,
            color: Color(0xFF9F7BFF),
          ),
        ),
      ),
    );
  }
}