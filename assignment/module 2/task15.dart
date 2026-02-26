import 'package:flutter/material.dart';

class Task15 extends StatelessWidget {
  const Task15({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final boxFitOptions = {
      'cover': BoxFit.cover,
      'contain': BoxFit.contain,
      'fill': BoxFit.fill,
      'fitWidth': BoxFit.fitWidth,
      'fitHeight': BoxFit.fitHeight,
      'none': BoxFit.none,
      'scaleDown': BoxFit.scaleDown,
    };

    return SingleChildScrollView(
      child: Column(
        children: boxFitOptions.entries.map((entry) {
          return Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                width: 300,
                height: 200,
                color: Colors.grey[300],
                child: Image.asset(
                  'assets/c.png',
                  fit: entry.value,
                ),
              ),
              Text('BoxFit.${entry.key}', style: const TextStyle(fontSize: 16)),
            ],
          );
        }).toList(),
      ),
    );
  }
}
