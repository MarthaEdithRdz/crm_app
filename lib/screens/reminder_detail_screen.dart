import 'package:flutter/material.dart';
import '../data/reminder_data.dart';
import '../model/reminder_model.dart';

class ReminderDetailScreen extends StatefulWidget {
  @override
  State<ReminderDetailScreen> createState() => _ReminderDetailScreen();
}

class _ReminderDetailScreen extends State<ReminderDetailScreen> {
  TextEditingController idController = TextEditingController(text: '0');
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController commentController = TextEditingController(text: '');
  TextEditingController statusController = TextEditingController(text: '0');
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
      commentController.text = arguments['comment'].toString();
      statusController.text = arguments['status'].toString();
    } else {
      idController.text = "0";
    }

    return (Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 128, 100, 205),
          title: const Text('Detalle Recordatorios'),
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
                  decoration: const InputDecoration(labelText: 'Recordatorio'),
                ),
                TextFormField(
                  controller: commentController,
                  decoration: const InputDecoration(labelText: 'Comentario'),
                ),
                TextFormField(
                    controller: statusController,
                    decoration: const InputDecoration(labelText: 'Estatus'),
                    keyboardType: TextInputType.number),
                ElevatedButton(
                  style:
                        ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 128, 100, 205)),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        Reminder obj = Reminder(
                          id: int.parse(idController.text),
                          name: nameController.text,
                          comment: commentController.text,
                          status: int.parse(statusController.text),
                        );

                        if (_new) {
                          await insertReminder(obj).then((_) {
                            Navigator.pop(context);
                          });
                        } else {
                          await updateReminder(obj).then((_) {
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
