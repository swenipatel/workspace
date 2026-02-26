import 'package:flutter/material.dart';

void main() {
  runApp(StackOverlayApp());
}

class StackOverlayApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stack Overlay Example',
      home: StackOverlayPage(),
    );
  }
}

class StackOverlayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stack Overlay'),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Background image
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                'https://via.placeholder.com/300x200',
                width: 300,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),

            // Semi-transparent overlay
            Container(
              width: 300,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.4),
                borderRadius: BorderRadius.circular(16),
              ),
            ),

            // Overlay text
            Text(
              'Overlay Text',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
