import 'package:shopping/core/store.dart';
import 'package:shopping/models/catalog.dart';
import "package:velocity_x/velocity_x.dart";

class CartModel {
  late CataLOgModel _catalog;

  final List<int> itemids = [];

  CataLOgModel get catalog => _catalog;
//get catalog
  set catalog(CataLOgModel newcatalog) {
    _catalog = newcatalog;
  }

//get items in the cart
  List<Item> get items =>
      itemids.map((item) => _catalog.getById(item)).toList();
//get total price
  num get TotalPrice => items.fold(0, (total, curr) => total + curr.price);

  //Add item
  //

//remove item

}

class Mutation extends VxMutation<MyStore> {
  final Item item;
  Mutation(this.item);
  perform() {
    store!.cart.itemids.add(item.id);
  }
}

class RMutation extends VxMutation<MyStore> {
  final Item item;
  RMutation(this.item);
  perform() {
    store!.cart.itemids.remove(item.id);
  }
}
