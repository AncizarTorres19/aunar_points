import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String username;

  const HomeScreen({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            username), // Mostrar el nombre de usuario en la barra de aplicación
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
                'Menú de Navegación',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('Mis Puntos'),
              onTap: () {
                // TODO: Agregar la lógica para navegar a la pantalla de "Mis Puntos"
              },
            ),
            ListTile(
              title: const Text('Eventos Aunar'),
              onTap: () {
                // TODO: Agregar la lógica para navegar a la pantalla de "Eventos Aunar"
              },
            ),
            ListTile(
              title: const Text('Contacto Bienestar'),
              onTap: () {
                // TODO: Agregar la lógica para navegar a la pantalla de "Contacto Bienestar"
              },
            ),
            ListTile(
              title: const Text('Cerrar Sesión'),
              onTap: () {
                // TODO: Agregar la lógica para cerrar la sesión del usuario
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child:
            Text('Contenido del HomeScreen'), // Puedes agregar contenido aquí
      ),
    );
  }
}
