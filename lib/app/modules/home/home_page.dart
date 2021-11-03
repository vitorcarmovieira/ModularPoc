import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Menu'),
        ),
        body: Column(
          children: [
            TextButton(
                onPressed: () => print('fui apertado'),
                child: const Text("Nova Pré-venda")),
            TextButton(
                onPressed: () => print('fui apertado'),
                child: const Text("Buscar Clientes")),
            TextButton(
                onPressed: () => Modular.to.navigate('/catalog'),
                child: const Text("Buscar Produtos"))
          ],
        ));
  }
}
