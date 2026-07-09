import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: AnimatedButton()));
}

class AnimatedButton extends StatefulWidget {
  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Animated Button")),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              isPressed = !isPressed;
            });
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 500),
            width: isPressed ? 200 : 150,
            height: isPressed ? 70 : 50,
            decoration: BoxDecoration(
              color: isPressed ? Colors.green : Colors.blue,
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: Text(
              "Press Me",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}