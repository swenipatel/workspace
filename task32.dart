//Implement a simple number guessing game where the computer generates a random number,
// and the user has to guess it. Use a lambda function to provide hints, such as “too high” or “too low.”
import 'dart:io';
import 'dart:math';

void main() {
  // Generate random number between 1 and 10
  int randomNumber = Random().nextInt(10) + 1;

  print("Guess the number between 1 and 10:");

  // Lambda function for hints
  String Function(int) hint = (int guess) {
    if (guess > randomNumber) {
      return "Too high!";
    } else if (guess < randomNumber) {
      return "Too low!";
    } else {
      return "Correct!";
    }
  };

  while (true) {
    // Read user input
    int userGuess = int.parse(stdin.readLineSync()!);

    String result = hint(userGuess);
    print(result);

    if (result == "Correct!") {
      break;
    }
  }
}
