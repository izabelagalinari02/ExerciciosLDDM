import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'TelaInicial.dart';

class MenuNavegacaoWidget extends StatefulWidget {
  const MenuNavegacaoWidget({super.key});

  @override
  _MenuNavegacaoWidgetState createState() =>
      _MenuNavegacaoWidgetState();
}

class _MenuNavegacaoWidgetState extends State<MenuNavegacaoWidget> {
  int index = 0;
  late SharedPreferences preferencias;
  late String? nome;

  @override
  Future<void> initState() async {
    super.initState();
    preferencias = await SharedPreferences.getInstance();
    nome = preferencias.getString('nome');
  }

  void itemTapped(int index) {
    setState(() {
      index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navegacao'),
      ),
      body: Center(
        child: irParaPagina(index),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Pesquisar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        currentIndex: index,
        onTap: itemTapped,
      ),
    );
  }

  Widget irParaPagina(int index) {
    switch (index) {
      case 0:
        return TelaIniciall(usuario: nome);
      case 1:
        return TelaPesquisar();
      case 2:
        return TelaPerfil();
      default:
        return TelaInicial();
    }
  }
}

class TelaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Tela inicial'),
    );
  }
}

class TelaPesquisar extends StatelessWidget {
  const TelaPesquisar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Tela de pesquisar'),
    );
  }
}

class TelaPerfil extends StatelessWidget {
  const TelaPerfil({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Tela perfil'),
    );
  }
}