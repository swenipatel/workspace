//Write a program that accepts a number and checks if it is a prime number or not.
import 'dart:io';
void main()
{
  print("enter your num:");
  int n = int.parse(stdin.readLineSync().toString());
  int x = 0;

  for (int i = 1; i <= n; i++) {
    if (n % i == 0) {
      x++;
    }
  }

  if (x == 2) {
    print("Prime number");
  } else {
    print("Not prime number");
  }
}