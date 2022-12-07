// ignore_for_file: use_key_in_widget_constructors, avoid_unnecessary_containers, import_of_legacy_library_into_null_safe

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterui/models/catalog.dart';
import 'package:flutterui/utils/routes.dart';
import 'package:flutterui/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';
import 'dart:convert';

import '../home_widgets/catalog_header.dart';
import '../home_widgets/catalog_image.dart';
import '../home_widgets/catalog_list.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name = "Sagar";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodeData = jsonDecode(catalogJson);
    var productsData = decodeData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
        backgroundColor: MyTheme.darkBluishColor,
        child: const Icon(CupertinoIcons.cart),
      ),
      body: SafeArea(
        child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CtalogHeader(),
                if (CatalogModel.items.isNotEmpty)
                  CatalogList().py16().expand()
                else
                  const CircularProgressIndicator().py16().centered().expand(),
              ],
            )),
      ),
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
              tag: Key(catalog.id.toString()),
              child: CatalogImage(image: catalog.image)),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.lg.color(MyTheme.darkBluishColor).bold.make(),
              catalog.desc.text.textStyle(context.captionStyle).make(),
              10.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${catalog.price}".text.bold.xl.make(),
                  ElevatedButton(
                      onPressed: () {},
                      child: "Add to cart".text.make(),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(const StadiumBorder()),
                        backgroundColor:
                            MaterialStateProperty.all(MyTheme.darkBluishColor),
                      )),
                ],
              ).pOnly(right: 8.0),
            ],
          ))
        ],
      ),
    ).white.rounded.square(150).make().p16();
  }
}
