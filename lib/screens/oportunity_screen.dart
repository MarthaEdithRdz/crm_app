import 'package:flutter/material.dart';
import '../model/oportunity_model.dart';
import '../data/oportunity_data.dart';

class OportunityScreen extends StatefulWidget {
  @override
  State<OportunityScreen> createState() => _OportunityScreen();
}

class _OportunityScreen extends State<OportunityScreen> {
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
          future: getAllOportunity(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      onDismissed: (direction) async {
                        deleteOportunity(snapshot.data![index]);
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
                          snapshot.data![index].description,
                          style: const TextStyle(fontSize: 15),
                        ),
                        subtitle: Text(
                          snapshot.data![index].comments,
                          style: const TextStyle(fontSize: 15),
                        ),
                        trailing: IconButton(
                            onPressed: (() async {
                              await Navigator.pushNamed(
                                  context, "/detOportunity",
                                  arguments: {
                                    "id": snapshot.data?[index].id.toString(),
                                    "description": snapshot
                                        .data?[index].description
                                        .toString(),
                                    "comments": snapshot.data?[index].comments
                                        .toString(),
                                    "amount":
                                        snapshot.data?[index].amount.toString(),
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
          await Navigator.pushNamed(context, '/detOportunity',
              arguments: {"id": "0", "description": ""});
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    ));
  }
}