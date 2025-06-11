import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final int days = 6;
  final String name = "areeba";

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Page"),),
      body: Center(child: Text("Birthday is on $days of $name")),
      drawer: const Drawer(),
    );
  }
}
