import 'package:flutter_application_1/models/catalog.dart';

class CartModel{
  // catalog field
  CatalogModel catalog;
  CartModel({required this.catalog});


  // collection of ids - store ids of each item
  final List<int> itemIds = [];


  // get items in the cart
  List<Item> get items => itemIds.map((id) => catalog.getById(id as String)).toList();

  // total price
  num get totalPrice => items.fold(0, (total, current) => total + current.price);

  // add item to cart
  void add(Item item) {
    itemIds.add(item.id as int);
  }

  // remove item from cart
  void remove(Item item) {
    itemIds.remove(item.id as int);
  }

}