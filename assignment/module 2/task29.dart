void main() {
  List<int> list1 = [1, 2, 3, 4];
  List<int> list2 = [3, 4, 5, 6];
  List<int> list3 = [6, 7, 8];

  // Combine using spread operator
  List<int> combined = [...list1, ...list2, ...list3];

  // Remove duplicates using Set
  List<int> uniqueList = combined.toSet().toList();

  // Sort ascending
  uniqueList.sort();

  print("Final List: $uniqueList");
}