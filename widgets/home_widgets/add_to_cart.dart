import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/cart.dart';
import 'package:flutter_application_1/models/catalog.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  AddToCart({super.key, required this.catalog});

  final cart = CartModel(); // singleton instance
  @override
  Widget build(BuildContext context) {
    bool isInCart = cart.items.contains(catalog);
    return ElevatedButton(
      onPressed: () {
        if (!cart.contains(catalog)) {
          cart.add(catalog);
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        shape: StadiumBorder(),
      ),
      child: isInCart
          ? const Icon(Icons.done, size: 20)
          : Icon(Icons.add_shopping_cart, size: 20),
    );
  }
}
