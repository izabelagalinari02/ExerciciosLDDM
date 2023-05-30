import 'package:flutter/material.dart';

class PaginaLista extends StatelessWidget {
  final List<String> itens = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6',
    'Item 7',
    'Item 8',
    'Item 9',
    'Item 10',
    // Add more items here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de itens'),
      ),
      body: ListView.builder(
        itemCount: itens.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(itens[index]),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Alerta'),
                    content: Text('Voce marcou o item $index'),
                    actions: [
                      TextButton(
                        child: const Text('Sim'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: const Text('Nao'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}