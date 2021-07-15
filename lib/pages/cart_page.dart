import 'dart:convert';
import 'package:shopping/models/cart.dart';
import 'package:shopping/widgets/themes.dart';

import '../models/catalog.dart';
import "package:flutter/material.dart";
import "package:velocity_x/velocity_x.dart";

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyTheme.cream,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: "Cart".text.make(),
        ),
        body: Column(
          children: [
            CardList().p32().expand(),
            Divider(),
            CartTotal(),
          ],
        ));
  }
}

class CartTotal extends StatelessWidget {
  final cart = CartModel();

  CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            "\$${cart.TotalPrice}"
                .text
                .xl5
                .color(context.theme.accentColor)
                .make(),
            ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: "Buying not supported yet".text.make()));
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            context.theme.buttonColor)),
                    child: "Buy".text.white.make())
                .w32(context)
          ],
        ));
  }
}

class CardList extends StatefulWidget {
  CardList({Key? key}) : super(key: key);

  @override
  _CardListState createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  final cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return cart.items.isEmpty
        ? "Nothing to show".text.makeCentered()
        : ListView.builder(
            itemCount: cart.items.length,
            itemBuilder: (context, index) => ListTile(
                leading: Icon(Icons.done),
                trailing: IconButton(
                  icon: Icon(Icons.remove_circle_outline),
                  onPressed: () {
                    cart.remove(cart.items[index]);
                    setState(() {});
                  },
                ),
                title: cart.items[index].name.text.make()));
  }
}
