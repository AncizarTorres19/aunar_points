import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:aunar_points/screens/my_points_screen.dart';
import 'package:aunar_points/screens/events_aunar_screen.dart';
import 'package:aunar_points/screens/contact_wellbeing_screen.dart';
import 'package:aunar_points/screens/login_screen.dart';

class HomeScreen extends StatefulWidget {
  final String username;

  const HomeScreen({Key? key, required this.username, User? user}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    MyPointsScreen(),
    EventsAunarScreen(),
    const ContactWellbeingScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _logout() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.username,
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Aunar Points',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('Mis Puntos'),
              onTap: () {
                _onItemTapped(0);
                Navigator.pop(context); // Cierra el drawer
              },
            ),
            ListTile(
              title: const Text('Eventos Aunar'),
              onTap: () {
                _onItemTapped(1);
                Navigator.pop(context); // Cierra el drawer
              },
            ),
            ListTile(
              title: const Text('Contacto Bienestar'),
              onTap: () {
                _onItemTapped(2);
                Navigator.pop(context); // Cierra el drawer
              },
            ),
            ListTile(
              title: const Text('Cerrar Sesión'),
              onTap: () {
                _logout();
                Navigator.pop(context); // Cierra el drawer
              },
            ),
          ],
        ),
      ),
      body: _screens[_selectedIndex],
    );
  }
}
