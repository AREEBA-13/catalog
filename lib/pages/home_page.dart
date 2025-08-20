import 'package:catalog/models/cart.dart';
import 'package:catalog/models/catalog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';

import '../core/store.dart';
import '../widgets/home_widgets/catalog_header.dart';
import '../widgets/home_widgets/catalog_list.dart' show CatalogList;
//import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
    // You can perform any initialization here if needed
  }

  Future<void> loadData() async {
    await Future.delayed(Duration(seconds: 1));
    final catalogJson = await rootBundle.loadString(
      "assets/files/catalog.json",
    );
    var decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(
      productsData,
    ).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final cart = (VxState.store as MyStore).cart;
    return Scaffold(
      backgroundColor: context.theme.canvasColor,
      floatingActionButton: VxBuilder<MyStore>(
        mutations: {AddMutation, RemoveMutation},
        builder: (context, store, status) => FloatingActionButton(
          backgroundColor: Theme.of(
            context,
          ).textButtonTheme.style?.backgroundColor?.resolve({}),
          onPressed: () => {Navigator.pushNamed(context, "/cart")},
          child: Icon(Icons.shopping_cart, color: Colors.white),
        ).badge(
          color: Vx.red700,
          size: 20,
          count: cart.items.length,
          textStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m24,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (CatalogModel.items.isNotEmpty)
                CatalogList().expand()
              else
                CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      ),
    );
  }
}
