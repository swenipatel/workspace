//Create a program that calculates the area and circumference of a circle. Use constants tostorethe value of pi.
import 'dart:io';
void main()
{
  print("enter your number:");
  var r = int.parse(stdin.readLineSync().toString());

  var pi=3.14;
  var area = r*r*pi;

  print("area = $area");

  var circumference = 2*pi*r;

  print("circumference = $circumference");
}