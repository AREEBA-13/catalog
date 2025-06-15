import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color.fromARGB(255, 76, 175, 80),
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                accountName: Text("Areeba Arif"),
                accountEmail: Text("aareebaarif32@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/ME.jpg"),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
              CupertinoIcons.home, color: Colors.white,
              ),
              title: Text(
                "Home",
                style: TextStyle(
                  color: Colors.white,
                ),
                ),
            ),
            ListTile(
              leading: Icon(
              CupertinoIcons.profile_circled, color: Colors.white,
              ),
              title: Text(
                "Profile",
                style: TextStyle(
                  color: Colors.white,
                ),
                ),
            ),
            ListTile(
              leading: Icon(
              CupertinoIcons.mail_solid, color: Colors.white,
              ),
              title: Text(
                "Email me",
                style: TextStyle(
                  color: Colors.white,
                ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}
