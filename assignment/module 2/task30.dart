void main() {
  List<int> numbers = [1, 2, 3, 4];

  List<num> result = applyOperation(numbers, (n) => n * n); // squares
  print("Squares: $result");
}

List<num> applyOperation(List<int> list, num Function(int) operation) {
  return list.map(operation).toList();
}