import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:shopping/core/store.dart';
import 'package:shopping/models/cart.dart';
import 'package:shopping/models/catalog.dart';
import 'package:shopping/widgets/themes.dart';
import "package:velocity_x/velocity_x.dart";

class AddToCart extends StatelessWidget {
  final Item catalog;
  AddToCart({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [Mutation, RMutation]);
    final CartModel cart = (VxState.store as MyStore).cart;

    bool isInCart = cart.items.contains(catalog) ? true : false;
    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          Mutation(catalog);
        }
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(MyTheme.darkblue),
          shape: MaterialStateProperty.all(
            StadiumBorder(),
          )),
      child: isInCart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus),
    );
  }
}
