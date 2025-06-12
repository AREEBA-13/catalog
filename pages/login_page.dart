import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/routes.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color.fromRGBO(240, 240, 240, 1),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/images/IconTT.png", width: 250, height: 200),
            SizedBox(height: 10.0),
            Text(
              "Welcome to TASTY TRACK",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text("Your personal digital recipe book"),
            SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 32.0,
              ),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Username",
                      hintText: " Enter Username",
                    ),
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Password",
                      hintText: " Enter Password",
                    ),
                  ),
                  SizedBox(height: 30.0),
                  ElevatedButton(
                    style: TextButton.styleFrom(minimumSize: Size(150, 40)),
                    onPressed: () {
                      Navigator.pushNamed(context, MyRoutes.homeRoute);
                    },
                    child: Text("LOGIN"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
