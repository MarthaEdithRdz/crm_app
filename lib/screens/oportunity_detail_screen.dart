import 'package:flutter/material.dart';
import '../data/oportunity_data.dart';
import '../model/oportunity_model.dart';

class OportunityDetailScreen extends StatefulWidget {
  @override
  State<OportunityDetailScreen> createState() => _OportunityDetailScreen();
}

class _OportunityDetailScreen extends State<OportunityDetailScreen> {
  TextEditingController idController = TextEditingController(text: '0');
  TextEditingController descriptionController = TextEditingController(text: '');
  TextEditingController commentsController = TextEditingController(text: '');
  TextEditingController amountController = TextEditingController(text: '0');
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
    if (arguments['description'] != "" && arguments['description'] != null) {
      _new = false;

      idController.text = arguments['id'].toString();
      descriptionController.text = arguments['description'].toString();
      commentsController.text = arguments['comments'].toString();
      amountController.text = arguments['amount'].toString();
      customerIdController.text = arguments['customerId'].toString();
    } else {
      idController.text = "0";
    }

    return (Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 128, 100, 205),
          title: const Text('Detalle Oportunidades'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: descriptionController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'El valor no puede ser nulo';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(labelText: 'Description'),
                ),
                TextFormField(
                  controller: commentsController,
                  decoration: const InputDecoration(labelText: 'Comentarios'),
                ),
                TextFormField(
                    controller: amountController,
                    decoration: const InputDecoration(labelText: 'Importe'),
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
                        Oportunity obj = Oportunity(
                          id: int.parse(idController.text),
                          description: descriptionController.text,
                          comments: commentsController.text,
                          amount: int.parse(amountController.text),
                          customerId: int.parse(customerIdController.text),
                        );

                        if (_new) {
                          await insertOportunity(obj).then((_) {
                            Navigator.pop(context);
                          });
                        } else {
                          await updateOportunity(obj).then((_) {
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
