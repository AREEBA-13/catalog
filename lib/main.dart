import 'package:catalog/models/cart.dart' show CartModel;
import 'package:catalog/models/catalog.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'core/store.dart';
import 'pages/cart_page.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';
import 'utils/routes.dart';
import 'widgets/themes.dart';

void main() {
  // Load the global catalog instance once
  final catalog = CatalogModel();

  // Set it in the singleton cart model
  CartModel().catalog = catalog;
  runApp(VxState(store: MyStore(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: MyThemes.lighttheme(context),
      darkTheme: MyThemes.darktheme(context),
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (context) => const HomePage(),
        MyRoutes.homeRoute: (context) => const HomePage(),
        MyRoutes.loginRoute: (context) => const LoginPage(),
        MyRoutes.cartRoute: (context) => const CartPage(),
      },
    );
  }
}
