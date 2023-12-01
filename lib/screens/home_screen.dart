import 'package:crm_app/screens/customer_detail_screen.dart';
import 'package:flutter/material.dart';

import '../screens/contact_screen.dart';
import '../screens/customer_screen.dart';
import '../screens/oportunity_screen.dart';
import '../screens/reminder_screen.dart';
import '../widgets/app_bar_widget.dart';

void main() => runApp(const HomeScreen());

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  int _selectedIndex = 0;
  String titleBar = "Clientes";

  static final List _screenOptions = [
    CustomerScreen(),
    ContactScreen(),
    OportunityScreen(),
    ReminderScreen()
  ];

  static final List _titleOptions = [
    'Clientes',
    'Contactos',
    'Oportunidades',
    'Recordatorios'
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      titleBar = _titleOptions[index];
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/catCustomer": (context) => CustomerScreen(),
        "/detCustomer": (context) => CustomerDetailScreen(),
      },
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBarWidget(text: titleBar),
        backgroundColor: const Color.fromARGB(255, 210, 209, 209),
        body: _screenOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
            onTap: _onItemTapped,
            selectedItemColor:Color.fromARGB(255, 128, 100, 205) ,
            currentIndex: _selectedIndex,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.corporate_fare), label: 'Clientes'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.contacts), label: 'Contactos'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.monetization_on), label: 'Oportunidades'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.comment), label: 'Recordatorios'),
            ]),
      ),
    );
  }
}