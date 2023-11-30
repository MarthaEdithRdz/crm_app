import 'package:flutter/material.dart';

import '../widgets/main_image.dart';
import '../widgets/text_field_main.dart';
import '../widgets/title_text.dart';

void main() => runApp(const LoginScreen());

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CRM',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('CRM'),
        ),
        body:  Padding(
          padding: const EdgeInsets.all(15.0),
          
          child: ListView(
            children: [
              MainImage(),
        
              const SizedBox(
              height: 18,
            ),

              TitleText(text:'Acceso a CRM',),
               
              const SizedBox(
              height: 18,
            ),
              TextFieldMain(labelText: 'Correo',
              icon: Icons.email,
              textController: _emailController,),
        
              const SizedBox(
              height: 18,
            ),
        
              TextFieldMain(labelText: 'Contraseña',
              icon: Icons.lock,
              textController: _passController,)
            ],
          ),
        ),
      ),
    );
  }
}




