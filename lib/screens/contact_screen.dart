import 'package:flutter/material.dart';
import '../model/contact_model.dart';
import '../data/contact_data.dart';

class ContactScreen extends StatefulWidget {
  @override
  State<ContactScreen> createState() => _ContactScreen();
}

class _ContactScreen extends State<ContactScreen> {
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
          future: getAllContact(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      onDismissed: (direction) async {
                        deleteContact(snapshot.data![index]);
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
                          snapshot.data![index].position,
                          style: const TextStyle(fontSize: 15),
                        ),
                        trailing: IconButton(
                            onPressed: (() async {
                              await Navigator.pushNamed(context, "/detContact",
                                  arguments: {
                                    "id": snapshot.data?[index].id.toString(),
                                    "name":
                                        snapshot.data?[index].name.toString(),
                                    "position": snapshot.data?[index].position
                                        .toString(),
                                    "phone":
                                        snapshot.data?[index].phone.toString(),
                                    "email":
                                        snapshot.data?[index].email.toString(),
                                    "comment": snapshot.data?[index].comment
                                        .toString(),
                                    "birthday": snapshot.data?[index].birthday
                                        .toString(),
                                    "birthmonth": snapshot
                                        .data?[index].birthmonth
                                        .toString(),
                                    "customerId": snapshot
                                        .data?[index].customerId
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
          await Navigator.pushNamed(context, '/detContact',
              arguments: {"id": "0", "name": ""});
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    ));
  }
}