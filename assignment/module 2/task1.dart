import 'package:flutter/material.dart';

class   Task1 extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return const MaterialApp
      (
      home: Scaffold
        (
        body: Center
          (
          child: Text
            (
            'Hello, Flutter!',
            style: TextStyle(fontSize: 40),
          ),
        ),
      ),
    );
  }
  
}
