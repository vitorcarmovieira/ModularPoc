import 'package:flutter_modular/flutter_modular.dart';
import 'package:suvfrontend/app/controller.dart';
import 'package:suvfrontend/app/modules/catalog/catalog_interface.dart';
import 'package:suvfrontend/app/modules/catalog/catalog_store.dart';
import 'package:flutter/material.dart';

class CatalogPage extends StatefulWidget {
  final String title;
  const CatalogPage({Key? key, this.title = 'CatalogPage'}) : super(key: key);
  @override
  CatalogPageState createState() => CatalogPageState();
}

class CatalogPageState extends State<CatalogPage> {
  final CatalogStore store = Modular.get();
  final ICatalogService service = Modular.get();
  final List<String> entries = <String>['A', 'B', 'C'];
  final Set<String> selected = Set();

  @override
  Widget build(BuildContext context) {
    final list = ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return SelectableListItem(
            index: index,
            onSelected: (String index) {
              selected.add(index);
            },
          );
        });
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Expanded(child: list),
          TextButton(
              onPressed: () =>
                  {service.selectedItem(selected), Modular.to.navigate('/')},
              child: const Text('Ok')),
        ],
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final index;
  final List<int> colorCodes = <int>[600, 500, 100];

  ListItem({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Colors.amber[colorCodes[index]],
      child: Row(
        children: [
          Text('Produto ${index}'),
        ],
      ),
    );
  }
}

class SelectableListItem extends ListItem {
  var index;
  final Function(String) onSelected;

  SelectableListItem({Key? key, required this.index, required this.onSelected})
      : super(key: key, index: index);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        super.build(context),
        Container(
          height: 20,
          color: Colors.black.withOpacity(0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Checkbox(
                value: false,
                onChanged: (value) => {onSelected(index.toString())},
              )
            ],
          ),
        )
      ],
    );
  }
}
// selected.add(entries[index])