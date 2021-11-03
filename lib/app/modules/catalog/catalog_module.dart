import 'package:suvfrontend/app/modules/catalog/catalog_Page.dart';
import 'package:suvfrontend/app/modules/catalog/catalog_interface.dart';
import 'package:suvfrontend/app/modules/catalog/catalog_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CatalogModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => CatalogStore()),
    Bind.lazySingleton((i) => Modular.get<ICatalogService>())
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => CatalogPage()),
  ];
}
