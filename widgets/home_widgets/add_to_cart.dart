import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/store.dart';
import 'package:flutter_application_1/models/cart.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  const AddToCart({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    VxState.listen(context, to: [AddMutation]);
    final CartModel cart = (VxState.store as MyStore).cart;

    bool isInCart = cart.items.contains(catalog);
    return ElevatedButton(
      onPressed: () {
        if (isInCart) {
          AddMutation(catalog);
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
