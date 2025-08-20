import 'package:catalog/models/catalog.dart';
import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          // print("${item.name} tapped");
          // You can navigate to a detail page or perform any action here
        },
        leading: Image.network(item.image),
        title: Text(item.name),
        subtitle: Text(item.des),
        trailing: Text(
          "\$${item.price.toString()}",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          maxLines: 3, // limit text lines
          overflow: TextOverflow.ellipsis, // add "..."
        ),
      ),
    );
  }
}
