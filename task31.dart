//Write a program that uses async* to create a stream of integers. Display each integer as it’s
//emitted and stop the stream after a certain count.

import 'dart:async';

void main() async {
  // Listen to the stream
  await for (int number in numberStream(5)) {
    print("Emitted number: $number");
  }

  print("Stream finished");
}

// Stream function using async*
Stream<int> numberStream(int count) async* {
  for (int i = 1; i <= count; i++) {
    await Future.delayed(Duration(seconds: 1)); // delay
    yield i; // emit value
  }
}

