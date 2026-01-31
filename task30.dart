//Create a function that uses higher-order functions. Define a List of numbers and pass it to a
//function that returns a list of squares, cubes, or halves based on the function passed as an argument

void main() {
  List<int> numbers = [1, 2, 3, 4, 5];


  print("Squares: ${processList(numbers, square)}");
  print("Cubes: ${processList(numbers, cube)}");
  print("Halves: ${processList(numbers, half)}");
}

List<double> processList(List<int> nums, double Function(int) operation) {
  return nums.map(operation).toList();
}


double square(int n) {
  return (n * n).toDouble();
}


double cube(int n) {
  return (n * n * n).toDouble();
}


double half(int n) {
  return n / 2;
}
