class Catalogue {
  static final items = [
    Item(
        id: 1,
        name: "Laptop Charger",
        desc: "This is a description",
        price: 966,
        imageUrl:
            "https://images.unsplash.com/photo-1575024357670-2b5164f470c3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80")
  ];
}

class Item {
  final num id;
  final String name;
  final String desc;
  final num price;
  final String imageUrl;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.imageUrl});
}
