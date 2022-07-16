import 'package:flutter/material.dart';

import 'package:urbanitservices/models/models.dart';

class DetailView extends StatelessWidget {
  final Item item;

  const DetailView({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      bottomNavigationBar: ButtonBar(
        buttonPadding: EdgeInsets.all(16.0),
        children: [
          Text(
            "\u{20B9}${item.price.toString()}",
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          ElevatedButton(
              onPressed: () {},
              child: Text("Add to cart"),
              style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)))),
        ],
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
            child: Column(
          children: [
            Image.network(item.imageUrl),
            Expanded(
                child: Container(
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(item.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 30)),
                ),
                Text(
                  item.desc,
                  style: const TextStyle(color: Colors.grey, fontSize: 20),
                ),
              ]),
            ))
          ],
        )),
      )),
    );
  }
}
