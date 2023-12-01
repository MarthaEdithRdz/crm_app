import 'package:flutter/material.dart';
import '../model/customer_model.dart';
import '../data/customer_data.dart';

class CustomerScreen extends StatefulWidget {
  @override
  State<CustomerScreen> createState() => _CustomerScreen();
}

class _CustomerScreen extends State<CustomerScreen> {
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
    return (Scaffold(
      
      body: FutureBuilder(
          future: getAllCustomer(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      onDismissed: (direction) async {
                        deleteCustomer(snapshot.data![index]);
                        snapshot.data?.removeAt(index);
                        setState(() {});
                      },
                      key: Key(snapshot.data![index].id.toString()),
                      child: ListTile(
                        leading: const Icon(
                          Icons.account_circle,
                          size: 32.0,
                        ),
                        title: Text(
                          snapshot.data![index].name,
                          style: const TextStyle(fontSize: 15),
                        ),
                        subtitle: Text(
                          snapshot.data![index].rfc,
                          style: const TextStyle(fontSize: 15),
                        ),
                        trailing: IconButton(
                            onPressed: (() async {
                              await Navigator.pushNamed(context, "/detCustomer",
                                  arguments: {
                                    "id": snapshot.data?[index].id.toString(),
                                    "name":
                                        snapshot.data?[index].name.toString(),
                                    "rfc": snapshot.data?[index].rfc.toString(),
                                    "web": snapshot.data?[index].web.toString(),
                                    "comment": snapshot.data?[index].comment
                                        .toString(),
                                  });
                              setState(() {});
                            }),
                            icon: const Icon(Icons.arrow_forward_ios)),
                      ),
                    );
                  });
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 128, 100, 205),
        onPressed: () async {
          await Navigator.pushNamed(context, '/detCustomer',
              arguments: {"id": "0", "name": ""});
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    ));
  }
}