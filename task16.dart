//Create a simple address book using a map, where the keys are names and the values are
// phone numbers. Add, update, and remove entries based on user input.
import 'dart:io';

void main() {
  Map<String, String> addressBook = {}; // Empty address book

  // ADD CONTACT
  print("Add a contact");
  print("Enter name:");
  String name = stdin.readLineSync()!;
  print("Enter phone number:");
  String phone = stdin.readLineSync()!;
  addressBook[name] = phone;
  print("Contact added: $addressBook");

  // UPDATE CONTACT
  print("\nUpdate a contact");
  print("Enter name to update:");
  String updateName = stdin.readLineSync()!;
  if (addressBook.containsKey(updateName)) {
    print("Enter new phone number:");
    String newPhone = stdin.readLineSync()!;
    addressBook[updateName] = newPhone;
    print("Contact updated: $addressBook");
  } else {
    print("Contact not found!");
  }

  // REMOVE CONTACT
  print("\nRemove a contact");
  print("Enter name to remove:");
  String removeName = stdin.readLineSync()!;
  if (addressBook.containsKey(removeName)) {
    addressBook.remove(removeName);
    print("Contact removed: $addressBook");
  } else {
    print("Contact not found!");
  }
}
