import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:shopping/models/cart.dart';
import 'package:shopping/models/catalog.dart';
import 'package:shopping/widgets/themes.dart';
import "package:velocity_x/velocity_x.dart";

class AddToCart extends StatefulWidget {
  Item catalog;
  AddToCart({Key? key, required this.catalog}) : super(key: key);

  @override
  _AddToCartState createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  final cart = CartModel();
  @override
  Widget build(BuildContext context) {
    bool isInCart = cart.items.contains(widget.catalog) ? true : false;
    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          isInCart = isInCart.toggle();
          final catalog = CataLOgModel();

          cart.catalog = catalog;
          cart.add(widget.catalog);

          setState(() {});
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
