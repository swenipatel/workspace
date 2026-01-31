//Implement a basic calculator that performs addition, subtraction, multiplication, or divisionbased on the user’s choice.
import 'dart:io';

void main()
{
  print("Enter Any choise: 1.addition 2.subtraction 3.multiplication 4.divisionbased ");
  var num = int.parse(stdin.readLineSync().toString());

  switch(num)
  {
    case 1:
      print("enter the first element:");
      int a = int.parse(stdin.readLineSync().toString());
      print("enter the second element:");
      int b = int.parse(stdin.readLineSync().toString());

      int c = a+b;
      print(c);

    case 2:
      print("enter the first element:");
      int a = int.parse(stdin.readLineSync().toString());
      print("enter the second element:");
      int b = int.parse(stdin.readLineSync().toString());

      int c = a-b;
      print(c);


    case 3:
      print("enter the firts element");
      int a = int.parse(stdin.readLineSync().toString());
      print("enter the second element");
      int b = int.parse(stdin.readLineSync().toString());

      int c = a*b;
      print(c);

    case 4:
      print("enter the first element");
      int a = int.parse(stdin.readLineSync().toString());
      print("enter the second element");
      int b = int.parse(stdin.readLineSync().toString());

      double c = a/b;
      print(c);


    default:print("Not valid");
  }

}


