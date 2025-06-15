import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String name = "Tasty Track";

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Page"),),
      body: Center(child: Text("This is $name")),
      drawer: const Drawer(),
    );
  }
}
