import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CartProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ShoppingScreen(),
    );
  }
}

class CartProvider extends ChangeNotifier {
  List<String> cart = [];

  void addItem(String item) {
    cart.add(item);
    notifyListeners();
  }
}

class ShoppingScreen extends StatelessWidget {
  final List<String> products = [
    "Laptop",
    "Phone",
    "Mouse",
    "Keyboard",
    "Headphone"
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Shopping Cart"),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(products[index]),
            trailing: ElevatedButton(
              child: const Text("Add"),
              onPressed: () {
                provider.addItem(products[index]);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.shopping_cart),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => CartScreen(),
            ),
          );
        },
      ),
    );
  }
}

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Cart")),
      body: ListView.builder(
        itemCount: provider.cart.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(provider.cart[index]),
          );
        },
      ),
    );
  }
}