import 'package:suvfrontend/app/modules/catalog/catalog_interface.dart';

class Controller extends ICatalogService {
  @override
  void selectedItem(Set<String> SelectedItems) {
    print("recebido os produtos selecionados: " + SelectedItems.toString());
  }
}
