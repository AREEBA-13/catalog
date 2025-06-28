// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_application_1/models/catalog.dart';

class CartModel {
  //singleton for global access
  static final cartModel = CartModel._internal();

  CartModel._internal();
  factory CartModel() => cartModel;

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

  // add item to cart
  void add(Item item) {
    _itemIds.add(item.id);
  }

  // ignore: collection_methods_unrelated_type
  bool contains(Item item) => _itemIds.contains(item.id);

  // remove item from cart
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
