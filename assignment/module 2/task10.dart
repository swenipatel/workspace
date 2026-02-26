import 'package:flutter/material.dart';

class Task10 extends StatefulWidget {
  const Task10({super.key});

  @override
  State<Task10> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<Task10> {
  int _cartCount = 0;

  final List<String> _items = [
    "Apple",
    "Banana",
    "Orange",
    "Mango",
    "Grapes",
    "Pineapple",
    "Strawberry",
  ];

  void _addToCart() {
    setState(() {
      _cartCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shopping Cart"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: Text(
                "Cart: $_cartCount",
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              title: Text(_items[index]),
              trailing: ElevatedButton(
                onPressed: _addToCart,
                child: const Text("Add to Cart"),
              ),
            ),
          );
        },
      ),
    );
  }
}
