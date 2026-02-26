import 'package:flutter/material.dart';

void main() {
  runApp(ProductListApp());
}

class ProductListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Listing', debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductListPage(),
    );
  }
}

class Product {
  final String name;
  final double price;
  final String imageUrl;

  Product({required this.name, required this.price, required this.imageUrl});
}

class ProductListPage extends StatelessWidget {

  final List<Product> products = [
    Product(
        name: 'Smartphone',
        price: 699.99,
        imageUrl:
        'https://via.placeholder.com/150/0000FF/FFFFFF?text=Smartphone'),
    Product(
        name: 'Laptop',
        price: 1299.99,
        imageUrl: 'https://via.placeholder.com/150/FF0000/FFFFFF?text=Laptop'),
    Product(
        name: 'Headphones',
        price: 199.99,
        imageUrl:
        'https://via.placeholder.com/150/00FF00/FFFFFF?text=Headphones'),
    Product(
        name: 'Camera',
        price: 499.99,
        imageUrl:
        'https://via.placeholder.com/150/FFA500/FFFFFF?text=Camera'),
    Product(
        name: 'Smartwatch',
        price: 249.99,
        imageUrl:
        'https://via.placeholder.com/150/800080/FFFFFF?text=Smartwatch'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: SizedBox(
          height: 220, // height for horizontal list
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return Container(
                width: 160,
                margin: EdgeInsets.symmetric(horizontal: 8),
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius:
                        BorderRadius.vertical(top: Radius.circular(12)),
                        child: Image.network(
                          product.imageUrl,
                          height: 120,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          product.name,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '\$${product.price.toStringAsFixed(2)}',
                        style: TextStyle(
                            fontSize: 14, color: Colors.green[700]),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
