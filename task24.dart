// Create a program that accepts a list of integers from the user. Use exception handling to
// handle cases where the user inputs non-integer values

import 'dart:io';

void main() {
  List<int> numbers = [];

  print("How many numbers do you want to enter?");
  int count = int.parse(stdin.readLineSync()!);

  for (int i = 0; i < count; i++) {
    while (true) {
      print("Enter number ${i + 1}:");
      String? input = stdin.readLineSync();
      try {
        int n = int.parse(input!);
        numbers.add(n);
        break; // exit the loop if input is valid
      } catch (e) {
        print("Invalid input! Please enter an integer.");
      }
    }
  }

  print("\nYour numbers are:");
  print(numbers);
}
