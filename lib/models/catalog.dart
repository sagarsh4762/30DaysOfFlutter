class CatalogModel {
  static final items = [
    Item(
        id: 1,
        name: "Iphone 12 Pro",
        desc: "Apple iphone 12th generation",
        price: 999,
        color: "#33505a",
        image:
            "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/iphone-14-model-unselect-gallery-1-202209?wid=5120&hei=2880&fmt=p-jpg&qlt=80&.v=1660689596976")
  ];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});
}
