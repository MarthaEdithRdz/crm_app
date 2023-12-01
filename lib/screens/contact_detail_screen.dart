// Code generates for Felipe's Programs
// We suggest to use the file: contact_detail_screen.dart

import 'package:flutter/material.dart';
import '../data/contact_data.dart';
import '../model/contact_model.dart';

class ContactDetailScreen extends StatefulWidget {
  @override
  State<ContactDetailScreen> createState() => _ContactDetailScreen();
}

class _ContactDetailScreen extends State<ContactDetailScreen> {
  TextEditingController idController = TextEditingController(text: '0');
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController positionController = TextEditingController(text: '');
  TextEditingController phoneController = TextEditingController(text: '');
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController commentController = TextEditingController(text: '');
  TextEditingController birthdayController = TextEditingController(text: '0');
  TextEditingController birthmonthController = TextEditingController(text: '0');
  TextEditingController customerIdController = TextEditingController(text: '0');
  bool _new = true;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;

    // Si manda diferente de vacio, llena los demás campos por que va a editar
    if (arguments['name'] != "" && arguments['name'] != null) {
      _new = false;

      idController.text = arguments['id'].toString();
      nameController.text = arguments['name'].toString();
      positionController.text = arguments['position'].toString();
      phoneController.text = arguments['phone'].toString();
      emailController.text = arguments['email'].toString();
      commentController.text = arguments['comment'].toString();
      birthdayController.text = arguments['birthday'].toString();
      birthmonthController.text = arguments['birthmonth'].toString();
      customerIdController.text = arguments['customerId'].toString();
    } else {
      idController.text = "0";
    }

    return (Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 128, 100, 205),
          title: const Text('Detalle Catálogo de contactos'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                TextFormField(
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'El valor no puede ser nulo';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(labelText: 'Nombre'),
                ),
                TextFormField(
                  controller: positionController,
                  decoration: const InputDecoration(labelText: 'Puesto'),
                ),
                TextFormField(
                  controller: phoneController,
                  decoration:
                      const InputDecoration(labelText: 'Teléfono móvil'),
                ),
                TextFormField(
                  controller: emailController,
                  decoration:
                      const InputDecoration(labelText: 'Correo electrónico'),
                ),
                TextFormField(
                  controller: commentController,
                  decoration: const InputDecoration(labelText: 'Comentario'),
                ),
                TextFormField(
                    controller: birthdayController,
                    decoration:
                        const InputDecoration(labelText: 'Dia de nacimiento'),
                    keyboardType: TextInputType.number),
                TextFormField(
                    controller: birthmonthController,
                    decoration:
                        const InputDecoration(labelText: 'Mes de nacimiento'),
                    keyboardType: TextInputType.number),
                TextFormField(
                    controller: customerIdController,
                    decoration:
                        const InputDecoration(labelText: 'Id del cliente'),
                    keyboardType: TextInputType.number),
                ElevatedButton(
                        style:
                        ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 128, 100, 205)),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        Contact obj = Contact(
                          id: int.parse(idController.text),
                          name: nameController.text,
                          position: positionController.text,
                          phone: phoneController.text,
                          email: emailController.text,
                          comment: commentController.text,
                          birthday: int.parse(birthdayController.text),
                          birthmonth: int.parse(birthmonthController.text),
                          customerId: int.parse(customerIdController.text),
                        );

                        if (_new) {
                          await insertContact(obj).then((_) {
                            Navigator.pop(context);
                          });
                        } else {
                          await updateContact(obj).then((_) {
                            Navigator.pop(context);
                          });
                        }
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Informacion guardada')),
                        );
                      }
                    },
                    child: const Text('Guardar'))
              ],
            ),
          ),
        )));
  }
}
