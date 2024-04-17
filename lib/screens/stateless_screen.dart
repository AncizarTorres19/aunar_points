import 'package:flutter/material.dart';

class SatatelessScreen extends StatelessWidget {
  const SatatelessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const fontSize30 = TextStyle(fontSize: 30);
    int besitos = 0;
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        title: const Text('Bichooooo!'),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Besitos para mi amorcito!', style: fontSize30),
            Text('$besitos', style: fontSize30),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.favorite),
        onPressed: () {
          print('Besitos para mi amorcito!');
          besitos++;
        },
      ),
    );
  }
}
