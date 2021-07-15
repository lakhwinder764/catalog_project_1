import "package:flutter/material.dart";
import 'package:shopping/pages/home_widget/add_to_cart.dart';
import "package:velocity_x/velocity_x.dart";

import '../widgets/themes.dart';

import "../models/catalog.dart";

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: MyTheme.cream,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl4.red800.make(),
            AddToCart(catalog: catalog).wh(120, 50)
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
                    tag: Key(catalog.id.toString()),
                    child: Image.network(catalog.image))
                .h32(context),
            Expanded(
                child: VxArc(
                    height: 30.0,
                    edge: VxEdge.TOP,
                    arcType: VxArcType.CONVEY,
                    child: Container(
                      color: Colors.white,
                      width: context.screenWidth,
                      child: Column(
                        children: [
                          catalog.name.text.xl4
                              .color(MyTheme.darkblue)
                              .bold
                              .make(),
                          catalog.desc.text.make(),
                          "Sed voluptua invidunt kasd dolore duo kasd vero clita clita nonumy, duo sit sit tempor rebum nonumy consetetur eos eos sit."
                              .text
                              .make()
                              .p16(),
                        ],
                      ).py64(),
                    )))
          ],
        ),
      ),
    );
  }
}
