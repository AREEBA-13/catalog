import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/widgets/home_widgets/add_to_cart.dart';
import 'package:flutter_application_1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

// This is the detail page for each item in the catalog

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      bottomNavigationBar: Container(
        color: context.theme.cardColor,
        child: OverflowBar(
          alignment: MainAxisAlignment.spaceBetween,
          spacing: 8.0,
          children: [
            "\$${catalog.price}".text.bold.red700.xl3.make(),
            AddToCart(catalog: catalog,).wh(140, 50),
          ],
        ).p24(),
      ),
      backgroundColor: context.theme.canvasColor,
      body: SafeArea(
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: SizedBox(
                height: 250, // adjust as needed
                width: double.infinity,
                child: Image.network(
                  catalog.image,
                  fit: BoxFit.contain, // or BoxFit.cover/fitWidth/fitHeight
                ),
              ),
            ).h32(context),
            Expanded(
              child: VxArc(
                height: 30,
                arcType: VxArcType.convey,
                edge: VxEdge.top,
                child: Container(
                  color: context.theme.cardColor,
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      catalog.name.text.xl4
                          .color(MyThemes.darkBluishColor)
                          .xl2
                          .bold
                          .make(),
                      catalog.des.text.textStyle(context.captionStyle).make(),
                      10.heightBox,
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
                              "Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "
                              "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
                          .text
                          .color(Theme.of(context).textTheme.bodyLarge?.color)
                          .textStyle(context.captionStyle)
                          .make()
                          .p16(),
                    ],
                  ).py64(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
