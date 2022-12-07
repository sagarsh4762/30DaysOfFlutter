import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterui/core/store.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/cart.dart';
import '../models/catalog.dart';
import '../widgets/theme.dart';

class AddtoCart extends StatelessWidget {
  final Item catalog;
  const AddtoCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    bool isInCart = _cart.items.contains(catalog);
    return ElevatedButton(
        onPressed: () {
          if (!isInCart) {
            AddMutation(item: catalog);
            //setState(() {});
          }
        },
        child: isInCart
            ? const Icon(Icons.done)
            : const Icon(CupertinoIcons.shopping_cart),
        style: ButtonStyle(
          shape: MaterialStateProperty.all(const StadiumBorder()),
          backgroundColor: MaterialStateProperty.all(MyTheme.darkBluishColor),
        ));
  }
}
