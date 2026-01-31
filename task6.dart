//Create a simple grading system that takes a student’s score as input and prints their grade:
// A: 90–100
// B: 80–89
// C: 70–79
// D: 60–69
// F: Below 60
import 'dart:io';

void main()
{
  print("enter your mark");
  int mark = int.parse(stdin.readLineSync().toString());

  if(mark>=90)
  {
    print("A GRADE");
  }
  else if(mark>=80)
  {
    print("B GRADE");
  }
  else if(mark>=70)
  {
    print("C GRADE");
  }
  else if(mark>=60)
  {
    print("D GRADE");
  }
  else
  {
    print("E");
  }
}