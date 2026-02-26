import 'package:flutter/material.dart';

class Task13 extends StatefulWidget {
  const Task13({Key? key}) : super(key: key);

  @override
  _NetworkImageSwitcherState createState() => _NetworkImageSwitcherState();
}

class _NetworkImageSwitcherState extends State<Task13> {
  // List of image URLs to switch between
  final List<String> _images = [
    'https://picsum.photos/300/200?image=10',
    'https://picsum.photos/300/200?image=20',
    'https://picsum.photos/300/200?image=30',
  ];

  int _currentIndex = 0;

  void _changeImage() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _images.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.network(
          _images[_currentIndex],
          width: 300,
          height: 200,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return SizedBox(
              width: 300,
              height: 200,
              child: Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                      : null,
                ),
              ),
            );
          },
          errorBuilder: (context, error, stackTrace) {
            return const SizedBox(
              width: 300,
              height: 200,
              child: Center(child: Icon(Icons.error)),
            );
          },
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: _changeImage,
          child: const Text('Change Image'),
        ),
      ],
    );
  }
}
