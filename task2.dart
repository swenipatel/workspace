//Create a program that converts temperature from Celsius to Fahrenheit and vice versa. Implement functions to handle both conversions and let the user choose the conversiontype.
import 'dart:io';
void main()
{
  print("chose the num: 1.CelsiusTOFahrenheit AND 2.FahrenheitToCelsius");
  var num = int.parse(stdin.readLineSync().toString());

  switch(num)
  {
    case 1:
      print("enter your temp in Celsius");
      var temp = int.parse(stdin.readLineSync().toString());

      var f = (temp * 1.8) + 32;

      print("Fahrenheit = $f");

    case 2:
      print("enter your temp in Fahrenheit");
      var temp = int.parse(stdin.readLineSync().toString());

      var c = (temp - 32)/(1.8);

      print("Celsius = $c");

    default:print("Not valid");
  }


}