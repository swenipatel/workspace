//Write a program to input a list of integers and sort them in ascending and descending order
// without using built-in sort methods.

import 'dart:io';

void main() {
  print("Enter numbers separated by space:");
  List<int> numbers = stdin.readLineSync()!
      .split(' ')
      .map((e) => int.parse(e))
      .toList();


  for (int i = 0; i < numbers.length; i++) {
    for (int j = i + 1; j < numbers.length; j++) {
      if (numbers[i] > numbers[j]) {
        int temp = numbers[i];
        numbers[i] = numbers[j];
        numbers[j] = temp;
      }
    }
  }
  print("Ascending: $numbers");


  for (int i = 0; i < numbers.length; i++) {
    for (int j = i + 1; j < numbers.length; j++) {
      if (numbers[i] < numbers[j]) {
        int temp = numbers[i];
        numbers[i] = numbers[j];
        numbers[j] = temp;
      }
    }
  }
  print("Descending: $numbers");
}
