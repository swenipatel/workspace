//Create a program that takes a list of words and removes any duplicates. Use a set to eliminateduplicates,
// then display the unique words in alphabetical order.

void main() {
  List<String> words = ["cat", "dog", "cat", "apple", "dog"];

  Set<String> set = {};
  for (String w in words) {
    set.add(w);
  }

  List<String> result = set.toList();
  result.sort();

  print(result);
}