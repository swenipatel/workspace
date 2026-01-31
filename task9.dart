//Write a function to calculate the factorial of a number entered by the user.
import 'dart:io';
void main()
{
  print("enter your number:");
  int n = int.parse(stdin.readLineSync().toString());
  int fact = 1,i;

  for ( i = 1; i <= n; i++)
  {
    fact *= i;
  }
  print("Factorial of $n is $fact");
}