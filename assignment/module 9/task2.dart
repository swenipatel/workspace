import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: FirstScreen()));
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("First Screen")),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => SecondScreen()),
            );
          },
          child: Hero(
            tag: 'image',
            child: Image.network(
              'https://picsum.photos/200',
              width: 150,
            ),
          ),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Second Screen")),
      body: Center(
        child: Hero(
          tag: 'image',
          child: Image.network(
            'https://picsum.photos/200',
            width: 300,
          ),
        ),
      ),
    );
  }
}