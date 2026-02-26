import 'package:flutter/material.dart';

class Task7 extends StatelessWidget {
  const Task7({super.key});

  @override
  Widget build(BuildContext context) {

    final List<String> imageUrls = [
      'https://picsum.photos/200?1',
      'https://picsum.photos/200?2',
      'https://picsum.photos/200?3',
      'https://picsum.photos/200?4',
      'https://picsum.photos/200?5',
      'https://picsum.photos/200?6',
      'https://picsum.photos/200?7',
      'https://picsum.photos/200?8',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Grid"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: GridView.builder(
          itemCount: imageUrls.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                imageUrls[index],
                fit: BoxFit.cover,
              ),
            );
          },
        ),
      ),
    );
  }
}
