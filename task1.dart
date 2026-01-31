//Write a program that takes a user's name and age as input and prints a welcome messagethat includes their name and how many years they have left until they turn 100.

import 'dart:io';
void main()
{
  print("enter your name");
  var name = stdin.readLineSync().toString();
  print("enter your age");
  int age = int.parse(stdin.readLineSync().toString());

  int b=100;
  b -= age;
  print(b);
  print("welcom $name and $b years is left for turning 100 years ");
}