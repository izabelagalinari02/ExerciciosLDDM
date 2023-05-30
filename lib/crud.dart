import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Future<Database> beginDatabase() async {
    final String databasesPath = await getDatabasesPath();
    final String path = join(databasesPath, 'my_database.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE users(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            email TEXT
          )
        ''');
      },
    );
  }

  static Future<void> insertUser(String nome, String email) async {
    final Database database = await beginDatabase();
    await database.insert(
      'usuarios',
      {
        'nome': nome,
        'email': email,
      },
    );
  }

  static Future<List<Map<String, dynamic>>> getUsers() async {
    final Database database = await beginDatabase();
    return await database.query('usuarios');
  }
}

class DatabaseExampleWidget extends StatelessWidget {
  const DatabaseExampleWidget({super.key});

  Future<void> _insertUser() async {
    await DatabaseHelper.insertUser('Izabela', 'izabela@exemplo.com');
  }

  Future<void> _getUsers() async {
    List<Map<String, dynamic>> usuarios = await DatabaseHelper.getUsers();
    print(usuarios);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Database exemplo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _insertUser,
              child: const Text('Inserir usuario'),
            ),
            ElevatedButton(
              onPressed: _getUsers,
              child: const Text('Carregar usuarios'),
            ),
          ],
        ),
      ),
    );
  }
}