import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:urbanitservices/models/models.dart';
import 'package:urbanitservices/pages/drawer.dart';
import 'package:urbanitservices/utils/itemWidget.dart';
import 'package:urbanitservices/utils/utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Myapp")),
      body: Center(
        child: Container(
          child: (Catalogue.items.isNotEmpty)
              ? GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1, mainAxisExtent: 300),
                  itemCount: Catalogue.items.length,
                  itemBuilder: (context, index) {
                    return ItemWidget(
                      item: Catalogue.items[index],
                    );
                  })
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      ),
      drawer: const MyDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {Navigator.pushNamed(context, MyRoutes.cartRoute)},
        backgroundColor: Colors.blueGrey,
        child: const Icon(Icons.shopping_cart),
      ),
    );
  }

  Future<void> loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    var ctJson = await rootBundle.loadString("assets/files/catalogue.json");
    var decodedJson = jsonDecode(ctJson);
    var products = decodedJson["products"];
    Catalogue.items =
        List.from(products).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }
}
