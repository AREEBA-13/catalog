import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  int days = 06;
  String name = "areeba";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page")),
      body: Center(
        child: Container(child: Text("birthday is on $days of $name")),
      ),
      drawer: Drawer(),
    );
  }
}
