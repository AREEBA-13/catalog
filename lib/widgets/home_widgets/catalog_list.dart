// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:catalog/models/catalog.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:catalog/widgets/home_widgets/catalog_image.dart';
import '../../pages/home_detail_page.dart';
import '../themes.dart';
import 'add_to_cart.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeDetailPage(catalog: catalog),
            ),
          ),
          child: CatalogItem(catalog: catalog),
        );
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImage(image: catalog.image),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                catalog.name.text.lg
                    .color(MyThemes.darkBluishColor)
                    .xl2
                    .bold
                    .make(),
                catalog.des.text
                    .textStyle(context.captionStyle)
                    .textStyle(context.textTheme.bodyMedium)
                    .make(),
                10.heightBox,
                OverflowBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  spacing: 8.0,
                  children: [
                    "\$${catalog.price}"
                        .text
                        .textStyle(context.textTheme.bodyMedium)
                        .bold
                        .xl
                        .make(),
                    AddToCart(catalog: catalog),
                  ],
                ).pOnly(right: 8.0),
              ],
            ),
          ),
        ],
      ),
    ).color(context.cardColor).rounded.height(150).make().py12();
  }
}
