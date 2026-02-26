import 'package:qr/qr.dart';

void main() {
  final qr = QrCode(4, QrErrorCorrectLevel.L);
  qr.addData('Hello Dart');
  qr.make();

  for (int y = 0; y < qr.moduleCount; y++) {
    String row = '';
    for (int x = 0; x < qr.moduleCount; x++) {
      row += qr.isDark(y, x) ? '██' : '  ';
    }
    print(row);
  }
}