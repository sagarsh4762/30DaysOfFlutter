// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: unused_field

import 'package:velocity_x/velocity_x.dart';

import 'package:flutterui/core/store.dart';
import 'package:flutterui/models/catalog.dart';

class CartModel {
  late CatalogModel _catalog;
  final List<int> _itemIds = [];

  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
  }

  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  //Add item
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;
  AddMutation({
    required this.item,
  });

  @override
  perform() {
    store!.cart._itemIds.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;
  RemoveMutation(
   this.item,
  );

  @override
  perform() {
    store!.cart._itemIds.remove(item.id);
  }
}
