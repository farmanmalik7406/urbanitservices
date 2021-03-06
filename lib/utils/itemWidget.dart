import 'package:flutter/material.dart';

import 'package:urbanitservices/models/models.dart';
import 'package:urbanitservices/pages/details.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({Key? key, required this.item})
      : assert(item != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailView(item: item),
          )),
      child: Card(
        margin: const EdgeInsets.all(16.0),
        shadowColor: Colors.deepPurple,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: const BorderSide(width: 1.0, style: BorderStyle.none)),
        child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Image.network(
                  item.imageUrl,
                  height: 150,
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 50, 10, 0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(item.name,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                      ),
                      Text(
                        item.desc,
                        style: const TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ButtonBar(
                        children: [
                          Text(
                            "\u{20B9}${item.price.toString()}",
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          ElevatedButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                  minimumSize: const Size(30, 30)),
                              child: const Text("Add To Cart")),
                        ],
                      )
                    ],
                  ),
                ))
              ],
            )),
      ),
    );
  }
}
