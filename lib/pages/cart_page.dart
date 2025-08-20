import 'package:catalog/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../core/store.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.bold.xl2.make(),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const CartList().p32().expand(),
          const Divider(),
          const CartTotal(),
        ],
      ),
    );
  }
}

class CartTotal extends StatelessWidget {
  const CartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    return VxBuilder(
      mutations: {RemoveMutation, AddMutation},
      builder: (context, __, ___) {
        final CartModel cart = (VxState.store as MyStore).cart;
        return SizedBox(
          height: 200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              "\$${cart.totalPrice}"
                  .text
                  .xl4
                  .color(Theme.of(context).colorScheme.secondary)
                  .make(),
              30.widthBox,
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: "Buying not supported yet".text.make()),
                  );
                },
                style: TextButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                ),
                child: "BUY".text.xl2.make(),
              ).w24(context),
            ],
          ),
        );
      },
    );
  }
}

class CartList extends StatelessWidget {
  const CartList({super.key});

  @override
  Widget build(BuildContext context) {
    return VxBuilder(
      mutations: {RemoveMutation},
      builder: (context, mutation, state) {
        final CartModel cart = (VxState.store as MyStore).cart;

        return cart.items.isEmpty
            ? "Nothing To show".text.xl3.makeCentered()
            : ListView.builder(
                itemCount: cart.items.length,
                itemBuilder: (context, index) => ListTile(
                  leading: const Icon(Icons.done),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => RemoveMutation(cart.items[index]),
                  ),
                  title: cart.items[index].name.text.make(),
                ),
              );
      },
    );
  }
}
