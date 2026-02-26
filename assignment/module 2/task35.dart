import 'package:path/path.dart' as p;

void main() {
  String filePath = "/home/user/docs/file.txt";

  print("Directory: ${p.dirname(filePath)}");
  print("Filename: ${p.basename(filePath)}");
  print("Extension: ${p.extension(filePath)}");
}