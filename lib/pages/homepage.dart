import 'package:flutter/material.dart';
import 'package:urbanitservices/models/models.dart';
import 'package:urbanitservices/pages/drawer.dart';
import 'package:urbanitservices/utils/itemWidget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dummy = List.generate(20, (index) => Catalogue.items[0]);
    print(dummy);
    return Scaffold(
      appBar: AppBar(title: const Text("Myapp")),
      body: Center(
        child: Container(
          child: ListView.builder(
            itemCount: dummy.length,
            itemBuilder: (context, index) {
              return ItemWidget(item: dummy[index]);
            },
          ),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
