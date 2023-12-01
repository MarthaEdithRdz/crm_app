import 'package:crm_app/widgets/button_main.dart';
import 'package:flutter/material.dart';

import '../widgets/main_image.dart';
import '../widgets/text_field_main.dart';
import '../widgets/title_text.dart';
import '../data/user_data.dart';
import '../model/user_model.dart';

void main() => runApp( LoginScreen());

class LoginScreen extends StatefulWidget {
   LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CRM',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        
        body:  Padding(
          padding: const EdgeInsets.all(15.0),
          
          child: Form(
            key: _formKey,
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
                textController: _emailController,
                validator: (value) {
                          if (value == '') {
                            return 'La contraseña no puede ser nula';
                          }
                        },),
                  
                const SizedBox(
                height: 18,
              ),
                  
                TextFieldMain(labelText: 'Contraseña',
                icon: Icons.lock,
                textController: _passController,
                obscureText: true,
                validator: (value) {
                          if (value == '') {
                            return 'La contraseña no puede ser nula';
                          }
                        },),
                
                const SizedBox(
                height: 18,
              ),
          
                ButtonMain(width: 329, height: 56, text: 'Entrar', onPressed: (){
                   if (_formKey.currentState!.validate()) {
                      
                        int res = 0;

                        Future<List<User>> lstUser;
                        User objUser;
                        lstUser = getAllUser();

                        lstUser.then((value) => (value.length));

                        lstUser.then((value) {
                          if (value.length > 0) {
                            objUser = value.elementAt(0);
                            if (objUser.email == _emailController.text &&
                                objUser.password == _passController.text) {
                              res = 1;
                            }

                            if (res != 1) {
                              _showMyDialog();
                            } else {
                              
                            }
                            }
                            });

                   }
                }),
                
                const SizedBox(
                height: 18,
              ),
          
                Row(
                    children: [
                      const Text(
                        '¿No tienes cuenta?',
                        style: TextStyle(
                          color: Color(0xFF837E93),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        width: 2.5,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/registro");
                        },
                        child: const Text(
                          'Registrate',
                          style: TextStyle(
                            color: Color(0xFF755DC1),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
          
              ],
            ),
          ),
        ),
      ),
    );
  }
  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Validación'),
          content:  SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('El usuario y/o contraseña'),
                Text('No esta autorizado para acceder a la aplicación'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Aceptar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}




