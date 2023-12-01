import 'package:flutter/material.dart';

void main() => runApp(const OportunityScreen());

class OportunityScreen extends StatefulWidget {
  const OportunityScreen({super.key});

  @override
  State<OportunityScreen> createState() => _OportunityScreenState();
}

class _OportunityScreenState extends State<OportunityScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}