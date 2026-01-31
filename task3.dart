//Write a program to take a number from the user and determine if it’s even or odd.
import 'dart:io';
void main()
{
  print("enter your number:");
  var num = int.parse(stdin.readLineSync().toString());

  if(num%2==0)
  {
    print("num is even");
  }
  else{
    print("num is odd");
  }
}