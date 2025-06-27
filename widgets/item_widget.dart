import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          print("${item.name} tapped");
          // You can navigate to a detail page or perform any action here
        },
        leading: Image.network(item.image),
        title: Text(item.name),
        subtitle: Text(item.des),
        trailing: Text(
          "\$${item.price.toString()}",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
