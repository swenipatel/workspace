import 'package:flutter/material.dart';

class Task8 extends StatelessWidget {
  const Task8({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> names = [
      'Abc',
      'ggs',
      'xhjzbx',
      'xyhxsh',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Names List"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: names.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(names[index]),
            onTap: () {
              debugPrint('${names[index]} tapped');
            },
          );
        },
      ),
    );
  }
}
