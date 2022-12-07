import 'package:flutter/material.dart';
import 'package:flutterui/pages/home_details_page.dart';

import '../models/catalog.dart';
import '../pages/home_page.dart';

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CatalogModel.items.length,
        itemBuilder: ((context, index) {
          final catalog = CatalogModel.items[index];
          return InkWell(
            onTap: (() => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeDetailPage(catalog: catalog)))),
            child: CatalogItem(
              catalog: catalog,
            ),
          );
        }));
  }
}
