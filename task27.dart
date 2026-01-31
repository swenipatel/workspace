// Write a function that simulates fetching multiple data points (e.g., list of users)
// asynchronously. Use await and async keywords to wait for each "data point" to load, then
// display all the data once loaded

import 'dart:async';


Future<String> fetchUser(int id) async {
  await Future.delayed(Duration(seconds: 1));
  return "User $id";
}


Future<void> allUsers() async {
  print("Fetching users, please wait...\n");

  List<String> users = [];

  for (int i = 1; i <= 5; i++) {
    String user = await fetchUser(i); /
    users.add(user);
    print("Fetched: $user");
  }

  print("\nAll users fetched:");
  print(users);
}

Future<void> main() async {
  await allUsers();
}
