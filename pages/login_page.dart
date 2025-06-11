import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Material(child:
     Center(child:
      Text("login page",style: TextStyle(
        fontSize: 30,
        color: Color.fromRGBO(228, 36, 228, 1),
        fontWeight: FontWeight.bold,
      ),
      ),
      ),
      );
  }
}
