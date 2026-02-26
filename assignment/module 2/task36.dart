import 'dart:io';

void main() async {
  try {
    File file = File('example.txt');

    await file.writeAsString("Hello Dart File!");

    String content = await file.readAsString();
    print("File Content: $content");
  } catch (e) {
    print("Error: $e");
  }
}