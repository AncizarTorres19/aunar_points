import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// Screens
import 'package:aunar_points/screens/contact_wellbeing_screen.dart';
import 'package:aunar_points/screens/events_aunar_screen.dart';
import 'package:aunar_points/screens/login_screen.dart';
import 'package:aunar_points/screens/my_points_screen.dart';

class HomeScreen extends StatefulWidget {
  final String username;

  const HomeScreen({Key? key, required this.username, User? user})
      : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    MyPointsScreen(),
    EventsAunarScreen(),
    ContactWellbeingScreen(),
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
        title: Text(widget.username),
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
            _buildListTile('Mis Puntos', 0),
            _buildListTile('Eventos Aunar', 1),
            _buildListTile('Contacto Bienestar', 2),
            _buildListTile('Cerrar Sesión', 3, onTap: _logout),
          ],
        ),
      ),
      body: _screens[_selectedIndex],
    );
  }

  ListTile _buildListTile(String title, int index, {VoidCallback? onTap}) {
    return ListTile(
      title: Text(title),
      onTap: () {
        _onItemTapped(index);
        Navigator.pop(context); // Cierra el drawer
        if (onTap != null) onTap();
      },
    );
  }
}
