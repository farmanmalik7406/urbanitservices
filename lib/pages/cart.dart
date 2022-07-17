import 'package:flutter/material.dart';
import 'package:urbanitservices/models/models.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  onAdd(index) {
    CartItems.items[index].qty++;
    setState(() {});
  }

  onRemove(index) {
    if (CartItems.items[index].qty == 1) {
      CartItems.items.removeAt(index);
      showSnackBar("Item Removed from cart", context);
    } else {
      CartItems.items[index].qty--;
    }
    setState(() {});
  }

  showSnackBar(String content, context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(content),
        duration: const Duration(milliseconds: 1500),
        width: 280.0, // Width of the SnackBar.
        padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 16.0 // Inner padding for SnackBar content.
            ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: CartItems.items.isNotEmpty
          ? ListView.builder(
              itemCount: CartItems.items.length,
              itemBuilder: (context, index) => Card(
                margin: const EdgeInsets.all(10.0),
                shadowColor: Colors.deepPurple,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListTile(
                    leading:
                        Image.network(CartItems.items[index].item.imageUrl),
                    title: Text(
                      CartItems.items[index].item.name,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    subtitle: ButtonBar(
                      children: [
                        IconButton(
                            onPressed: () {
                              onRemove(index);
                            },
                            icon: const Icon(Icons.remove_circle),
                            color: Colors.deepPurple),
                        Text(CartItems.items[index].qty.toString()),
                        IconButton(
                          onPressed: () {
                            onAdd(index);
                          },
                          icon: const Icon(Icons.add_circle),
                          color: Colors.deepPurple,
                        )
                      ],
                    ),
                    trailing: Text(
                      "\u{20B9}${CartItems.items[index].item.price * CartItems.items[index].qty}",
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.blueGrey),
                    ),
                  ),
                ),
              ),
            )
          : const Center(
              child: Text(
              "No Items in cart",
              style: TextStyle(fontSize: 30, color: Colors.grey),
            )),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ButtonBar(children: [
          CartItems.items.isNotEmpty
              ? ElevatedButton(onPressed: () {}, child: const Text("Checkout"))
              : ElevatedButton(
                  onPressed: () {}, child: const Text("Continue Shopping"))
        ]),
      ),
    );
  }
}
