import 'dart:math';
import 'dart:io';

void main() {
  int randomNumber = Random().nextInt(10) + 1;

  String hint(int guess) =>
      guess > randomNumber ? "Too High" : "Too Low";

  print("Guess a number between 1 and 10:");

  while (true) {
    int guess = int.parse(stdin.readLineSync()!);

    if (guess == randomNumber) {
      print("Correct!");
      break;
    } else {
      print(hint(guess));
    }
  }
}