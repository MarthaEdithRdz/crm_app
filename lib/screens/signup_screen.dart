import 'package:flutter/material.dart';
import '../widgets/title_text.dart';
import '../widgets/text_field_main.dart';
import '../widgets/button_main.dart';
import '../widgets/app_bar_widget.dart';
import '../data/user_data.dart';
import '../model/user_model.dart';

import '../utils/validator.dart';

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

  final _formKey = GlobalKey<FormState>();

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
            color: Color.fromRGBO(159, 123, 255, 1),
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
            child: Form(
              key: _formKey,
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
                      icon: Icons.person,
                      validator: (value) {
                        if (value == '') {
                          return 'El nombre no puede ser nulo';
                        }
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFieldMain(
                      textController: _emailController,
                      labelText: 'Correo',
                      icon: Icons.email,
                      validator: (value) {
                        if (value == '') {
                          return 'El correo no puede ser nulo';
                        }
                        if (!isValidEmail(_emailController.text)) {
                          return 'Correo inválido';
                        }
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFieldMain(
                      textController: _passController,
                      labelText: 'Contraseña',
                      icon: Icons.lock,
                      obscureText: true,
                      validator: (value) {
                        if (value == '') {
                          return 'La contraseña no puede ser nula';
                        }
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFieldMain(
                      textController: _repassController,
                      labelText: 'Confirmar Contraseña',
                      icon: Icons.lock,
                      obscureText: true,
                      validator: (value) {
                        if (value != _passController.text) {
                          return 'El valor de la contraseña no coincide';
                      }}),
                  const SizedBox(
                    height: 25,
                  ),
                  ButtonMain(
                    width: 329,
                    height: 56,
                    text: 'Crear cuenta',
                    onPressed: () async{
                      if (_formKey.currentState!.validate()) {

                          User obj = User(
                          id: 0,
                          name: _nameController.text,
                          email: _emailController.text,
                          password: _passController.text,
                        );

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Usuario creado con éxito')),
                        );
                        await insertUser(obj).then((_) {
                          Navigator.pop(context);
                        });
                      }
                    },
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
          ),
        ],
      ),
    );
  }
}