// Code generates for Felipe's Programs
// We suggest to use the file: customer_detail_screen.dart

import 'package:flutter/material.dart';
import '../data/customer_data.dart';
import '../model/customer_model.dart';

class CustomerDetailScreen extends StatefulWidget {
  @override
  State<CustomerDetailScreen> createState() => _CustomerDetailScreen();
}

class _CustomerDetailScreen extends State<CustomerDetailScreen> {
  TextEditingController idController = TextEditingController(text: '0');
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController rfcController = TextEditingController(text: '');
  TextEditingController webController = TextEditingController(text: '');
  TextEditingController commentController = TextEditingController(text: '');
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
      rfcController.text = arguments['rfc'].toString();
      webController.text = arguments['web'].toString();
      commentController.text = arguments['comment'].toString();
    } else {
      idController.text = "0";
    }

    return (Scaffold(
        appBar: AppBar(
          title: const Text('Detalle Catálogo de clientes'),
          backgroundColor: Color.fromARGB(255, 128, 100, 205),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'El valor no puede ser nulo';
                    }
                    return null;
                  },
                  decoration:
                      const InputDecoration(labelText: 'Nombre del cliente'),
                ),
                TextFormField(
                  controller: rfcController,
                  decoration: const InputDecoration(labelText: 'RFC'),
                ),
                TextFormField(
                  controller: webController,
                  decoration: const InputDecoration(labelText: 'Página web'),
                ),
                TextFormField(
                  controller: commentController,
                  decoration: const InputDecoration(labelText: 'Comentario'),
                ),
                ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        Customer obj = Customer(
                          id: int.parse(idController.text),
                          name: nameController.text,
                          rfc: rfcController.text,
                          web: webController.text,
                          comment: commentController.text,
                        );

                        if (_new) {
                          await insertCustomer(obj).then((_) {
                            Navigator.pop(context);
                          });
                        } else {
                          await updateCustomer(obj).then((_) {
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
