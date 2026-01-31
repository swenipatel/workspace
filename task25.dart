//Write a program that simulates a delayed operation using Future.delayed. Display a
// loading message, wait for 3 seconds, and then show a completion message.

import 'dart:async';

Future<void> time() async {
  print("Please wait some time...");

  await Future.delayed(Duration(seconds: 3));

  print("\nYour message is completed");
}

Future<void> main() async {
  await time();
}
