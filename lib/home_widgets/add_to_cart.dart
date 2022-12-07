import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/cart.dart';
import '../models/catalog.dart';
import '../widgets/theme.dart';

class AddtoCart extends StatelessWidget {
  final Item catalog;
  AddtoCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items.contains(catalog) ?? false;
    return ElevatedButton(
        onPressed: () {
          if (!isInCart) {
            isInCart = isInCart.toggle();
            final _catalog = CatalogModel();

            _cart.catalog = _catalog;
            _cart.add(catalog);
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
