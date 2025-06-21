import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/widgets/drawer.dart';
import 'package:flutter_application_1/widgets/item_widget.dart';

//dummy list generated from CatalogModel

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final DummyList = List.generate(100, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(title: const Text("Home Page")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: DummyList.length,
          itemBuilder: (context, index) {
            return ItemWidget(item: DummyList[index]);
          },
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
