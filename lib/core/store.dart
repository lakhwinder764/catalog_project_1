import 'package:velocity_x/velocity_x.dart';

import 'package:shopping/models/cart.dart';
import 'package:shopping/models/catalog.dart';

class MyStore extends VxStore {
  late CataLOgModel catalog;
  late CartModel cart;
  MyStore() {
    catalog = CataLOgModel();
    cart = CartModel();
    cart.catalog = catalog;
  }
}
