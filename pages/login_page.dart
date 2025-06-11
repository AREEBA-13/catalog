import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color.fromRGBO(240, 240, 240, 1),
      child: Column(
        children: [
          Image.asset("assets/images/login_image.png", width: 250, height: 200),
          SizedBox(height: 10.0),
          Text(
            "WELCOME",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
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
                  onPressed: () {
                    print("hellow baby");
                  },
                  child: Text("LOGIN"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
