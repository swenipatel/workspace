//Write a program that counts the frequency of each character in a given string and stores theresult in a map.
void main() {
  String word = "TOPS";
  Map<String, int> f = {};

  for (int i = 0; i < word.length; i++) {
    String c = word[i];

    f[c] = (f[c] ?? 0) + 1;
  }

  print(f);
}