import 'package:flutter/material.dart';
import '../widgets/title_text.dart';
import '../widgets/text_field_main.dart';
import '../widgets/button_main.dart';
import '../widgets/app_bar_widget.dart';

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({super.key});

  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _repassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /*Padding(
            padding: const EdgeInsets.only(left: 15, top: 15),
            child: Image.asset(
              "assets/images/crm.png",
              width: 413,
              height: 250,
            ),
          ),*/
          Container(
            padding: EdgeInsets.all(20),
            color: const Color(0xFF9F7BFF),
            child: Image.asset(
              'assets/images/crm.jpeg',
              fit: BoxFit.contain,
              height: 45,
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              textDirection: TextDirection.ltr,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TitleText(text: 'Crear nueva cuenta'),
                const SizedBox(
                  height: 20,
                ),
                TextFieldMain(
                    textController: _nameController,
                    labelText: 'Nombre completo',
                    icon: Icons.person),
                const SizedBox(
                  height: 20,
                ),
                TextFieldMain(
                    textController: _emailController,
                    labelText: 'Correo',
                    icon: Icons.email),
                const SizedBox(
                  height: 20,
                ),
                TextFieldMain(
                    textController: _passController,
                    labelText: 'Contraseña',
                    icon: Icons.lock),
                const SizedBox(
                  height: 20,
                ),
                TextFieldMain(
                    textController: _repassController,
                    labelText: 'Confirmar Contraseña',
                    icon: Icons.lock),
                const SizedBox(
                  height: 25,
                ),
                ButtonMain(
                  width: 329,
                  height: 56,
                  text: 'Crear cuenta',
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    const Text(
                      ' ¿Tienes cuenta? ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF837E93),
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      width: 2.5,
                    ),
                    InkWell(
                      onTap: () {},
                      child: TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text(
                          'Accede',
                          style: TextStyle(
                            color: Color(0xFF755DC1),
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}