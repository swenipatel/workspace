import 'dart:async';

void main() async {
  await for (int value in countStream(5)) {
    print(value);
  }
}

Stream<int> countStream(int max) async* {
  for (int i = 1; i <= max; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}