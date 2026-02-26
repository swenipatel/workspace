import 'package:flutter/material.dart';

class Task5 extends StatelessWidget {
  const Task5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Responsive Row Layout")),
      body: Row(
        children: [

          Expanded(
            flex: 1,
            child: Container(
              height: double.infinity,
              color: Colors.red,
              child: const Center(
                child: Text(
                  "1",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),
          ),

          Expanded(
            flex: 2,
            child: Container(
              height: double.infinity,
              color: Colors.green,
              child: const Center(
                child: Text(
                  "2",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),
          ),

          Expanded(
            flex: 1,
            child: Container(
              height: double.infinity,
              color: Colors.blue,
              child: const Center(
                child: Text(
                  "3",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
