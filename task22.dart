//Write a program that reads a file and displays its contents. Handle potential file not foundexceptions and display
// an error message if the file doesn’t exist.


import 'dart:io';
void main() {
  try {
    File f = File("D://xyz.txt");
    f.writeAsString("Hello From Tops");
  }
  catch(e)
  {
    print(e);
  }
  finally
      {
        print("Executed");
      }
}