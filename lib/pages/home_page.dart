// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutterui/models/catalog.dart';
import 'package:flutterui/widgets/drawer.dart';
import 'package:flutterui/widgets/item_widget.dart';

class HomePage extends StatelessWidget {
  final int days = 30;
  final String name = "Sagar";
  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(5, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Catalog App",
        ),
      ),
      body: ListView.builder(
        itemCount: dummyList.length,
        itemBuilder: (context, index) {
          return ItemWidget(
            item: dummyList[index],
          );
        },
      ),
      drawer: MyDrawer(),
    );
  }
}
