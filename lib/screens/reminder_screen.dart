import 'package:flutter/material.dart';
import '../model/reminder_model.dart';
import '../data/reminder_data.dart';

class ReminderScreen extends StatefulWidget {
  @override
  State<ReminderScreen> createState() => _ReminderScreen();
}

class _ReminderScreen extends State<ReminderScreen> {
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
          future: getAllReminder(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      onDismissed: (direction) async {
                        deleteReminder(snapshot.data![index]);
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
                          snapshot.data![index].comment,
                          style: const TextStyle(fontSize: 15),
                        ),
                        trailing: IconButton(
                            onPressed: (() async {
                              await Navigator.pushNamed(context, "/detReminder",
                                  arguments: {
                                    "id": snapshot.data?[index].id.toString(),
                                    "name":
                                        snapshot.data?[index].name.toString(),
                                    "comment": snapshot.data?[index].comment
                                        .toString(),
                                    "status":
                                        snapshot.data?[index].status.toString(),
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
          await Navigator.pushNamed(context, '/detReminder',
              arguments: {"id": "0", "name": ""});
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    ));
  }
}