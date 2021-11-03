import 'package:flutter_modular/flutter_modular.dart';
import 'package:suvfrontend/app/controller.dart';
import 'package:suvfrontend/app/modules/catalog/catalog_module.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [Bind.singleton((i) => Controller())];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/catalog', module: CatalogModule()),
    ModuleRoute(Modular.initialRoute, module: HomeModule()),
  ];
}
