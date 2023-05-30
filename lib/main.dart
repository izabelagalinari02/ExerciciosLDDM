
import 'package:flutter/material.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';


import 'PaginaLista.dart';
import 'cadastro.dart';

import 'crud.dart';
import 'login.dart';
import 'menuNavegacao.dart';


void main() async {
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;

  runApp(const ExerciseHubApp());
}



class ExerciseHubApp extends StatelessWidget {
  const ExerciseHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercise Hub',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/Exercicio1': (context) => const Cadastro(),
        '/Exercicio2': (context) => Login(),
        '/Exercicio3': (context) => const MenuNavegacaoWidget(),
        '/Exercicio4': (context) => PaginaLista(),
        '/Exercicio5': (context) => const DatabaseExampleWidget(),

        // Add more routes for other exercises
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercicios'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/Exercicio1');
              },
              child: const Text('Exercício cadastro'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/Exercicio2');
              },
              child: const Text('Exercício Login'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/Exercicio3');
              },
              child: const Text('Exercício Menu navegacao'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/Exercicio4');
              },
              child: const Text('Exercício lista itens'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/Exercicio5');
              },
              child: const Text('CRUD'),
            ),
            // Add more buttons for other exercises
          ],
        ),
      ),
    );
  }
}