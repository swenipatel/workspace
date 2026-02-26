import 'package:flutter/material.dart';

class Task2 extends StatefulWidget {
  const Task2({super.key});

  @override
  State<Task2> createState() => _task2State();
}

class _task2State extends State<Task2> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
        appBar: AppBar
          (
          title: const Text('Counter App'),
          centerTitle: true,
          ),
      body: Center
        (
        child: Text
          (
          '$_counter',
          style: const TextStyle(fontSize: 60),
          ),
        ),
      floatingActionButton: FloatingActionButton
        (
        onPressed: _incrementCounter,
        child: const Icon(Icons.add),
        ),
      );
  }
}
