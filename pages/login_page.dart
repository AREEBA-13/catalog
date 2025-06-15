import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  Future<void> moveToHome() async {
    final form = _formKey.currentState;
    if (form != null && form.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      if (!mounted) return; // Check if the widget is still mounted
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color.fromRGBO(240, 240, 240, 1),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset("assets/images/IconTT.png", width: 250, height: 200),
              SizedBox(height: 10.0),
              Text(
                "Welcome to TASTY TRACK $name",
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Username can't be empty";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
                    ),

                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Password",
                        hintText: " Enter Password",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password can't be empty";
                        } else if (value.length < 6) {
                          return "Password lenght must be atleast 6";
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 30.0),

                    Material(
                      color: const Color.fromARGB(255, 30, 121, 65),

                      // shape: changeButton?
                      // BoxShape.circle:
                      // BoxShape.rectangle
                      borderRadius: BorderRadius.circular(
                        changeButton ? 50 : 8,
                      ),
                      child: InkWell(
                        onTap: () => moveToHome(),
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          height: 50,
                          width: changeButton ? 50 : 150,
                          alignment: Alignment.center,
                          child: changeButton
                              ? Icon(
                                  Icons.done,
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                )
                              : Text(
                                  "LOGIN",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        ),
                      ),
                    ),

                    // ElevatedButton(
                    //   style: TextButton.styleFrom(minimumSize: Size(150, 40)),
                    //   onPressed: () {
                    //     Navigator.pushNamed(context, MyRoutes.homeRoute);
                    //   },
                    //   child: Text("LOGIN"),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
