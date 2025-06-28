import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/cart.dart';
import 'package:flutter_application_1/models/catalog.dart';

class AddToCart extends StatefulWidget {
  final Item catalog;
  const AddToCart({super.key, required this.catalog});

  @override
  // ignore: library_private_types_in_public_api
  _AddToCartState createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  final cart = CartModel(); // singleton instance
  @override
  Widget build(BuildContext context) {
    bool isInCart = cart.items.contains(widget.catalog);
    return ElevatedButton(
      onPressed: () {
        if (!cart.contains(widget.catalog)) {
          cart.add(widget.catalog);
          setState(() {
            isInCart = true;
          });

          // Debug log
          // print("Cart now has ${cart.items.length} items.");
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        shape: StadiumBorder(),
      ),
      child: isInCart
          ? const Icon(Icons.done)
          : Icon(Icons.add_shopping_cart_outlined),
    );
  }
}
