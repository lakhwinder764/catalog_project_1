import 'package:shopping/models/catalog.dart';

class CartModel {
  static final cartModel = CartModel.internal();

  CartModel.internal();
  factory CartModel() => cartModel;
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
  void add(Item item) {
    itemids.add(item.id);
  }

//remove item
  void remove(Item item) {
    itemids.remove(item.id);
  }
}
