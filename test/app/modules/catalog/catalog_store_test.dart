import 'package:flutter_test/flutter_test.dart';
import 'package:suvfrontend/app/modules/catalog/catalog_store.dart';
 
void main() {
  late CatalogStore store;

  setUpAll(() {
    store = CatalogStore();
  });

  test('increment count', () async {
    expect(store.state, equals(0));
    store.update(store.state + 1);
    expect(store.state, equals(1));
  });
}