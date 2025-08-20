import 'package:catalog/core/store.dart';
import 'package:velocity_x/velocity_x.dart';
import 'catalog.dart';

class CartModel {
  // catalog field
  late CatalogModel _catalog;

  // collection of ids - store ids of each item
  final List<String> _itemIds = [];

  set catalog(CatalogModel newCatalog) {
    //assert(newCatalog != null);
    _catalog = newCatalog;
  }

  // get items in the cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  // total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  // ignore: collection_methods_unrelated_type
  bool contains(Item item) => _itemIds.contains(item.id);
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    store?.cart._itemIds.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);
  @override
  perform() {
    store?.cart._itemIds.remove(item.id);
  }
}
