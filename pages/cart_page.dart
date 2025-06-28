import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

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
          CartList()
          .p32()
          .expand(),
           Divider(), 
           CartTotal()],
      ),
    );
  }
}

class CartTotal extends StatelessWidget {
  const CartTotal({super.key});


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$9999".text.xl4
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
  }
}




class CartList extends StatefulWidget {
  const CartList({super.key});

  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: 5,
    itemBuilder: (context, index)=> ListTile(
      leading: Icon(Icons.done),
      title: "Item $index".text.make(),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
          // Handle delete action
        },
      ),
    ));
  }
}
