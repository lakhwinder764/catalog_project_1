import 'dart:convert';
import 'package:shopping/core/store.dart';
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
  CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartModel cart = (VxState.store as MyStore).cart;
    return SizedBox(
        height: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            VxConsumer(
              notifications: {},
              mutations: {RMutation},
              builder: (BuildContext context, store, VxStatus? status) {
                return "\$${cart.TotalPrice}"
                    .text
                    .xl5
                    .color(MyTheme.darkblue)
                    .make();
              },
            ),
            ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: "Buying not supported yet".text.make()));
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(MyTheme.darkblue)),
                    child: "Buy".text.white.make())
                .w32(context)
          ],
        ));
  }
}

class CardList extends StatelessWidget {
  CardList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartModel cart = (VxState.store as MyStore).cart;
    VxState.watch(context, on: [RMutation]);
    return cart.items.isEmpty
        ? "Nothing to show".text.makeCentered()
        : ListView.builder(
            itemCount: cart.items.length,
            itemBuilder: (context, index) => ListTile(
                leading: Icon(Icons.done),
                trailing: IconButton(
                  icon: Icon(Icons.remove_circle_outline),
                  onPressed: () {
                    RMutation(cart.items[index]);
                  },
                ),
                title: cart.items[index].name.text.make()));
  }
}
