import 'package:catalog/models/cart.dart';
import 'package:catalog/models/catalog.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../core/store.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  const AddToCart({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    final CartModel cart = (VxState.store as MyStore).cart;

    return VxBuilder<MyStore>(
      mutations: const {AddMutation, RemoveMutation},
      builder: (context, store, status) {
        final bool isInCart = cart.contains(catalog);

        return ElevatedButton(
          onPressed: () {
            if (!isInCart) {
              AddMutation(catalog);
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            shape: const StadiumBorder(),
          ),
          child: isInCart
              ? const Icon(Icons.done, size: 20)
              : const Icon(Icons.add_shopping_cart, size: 20),
        );
      },
    );
  }
}
