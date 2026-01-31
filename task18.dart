//Define a BankAccount class with properties like account number, account holder, andbalance.
// Add methods to deposit, withdraw, and check the balance. Ensure the withdrawmethod doesn’t allow overdrafts.

import 'dart:io';

class BankAccount {
  int accountNumber;
  String accountHolder;
  double balance;

  BankAccount(this.accountNumber, this.accountHolder, this.balance);

  void deposit(double amount) {
    balance += amount;
    print("\$$amount deposited. New balance: \$${balance}");
  }

  void withdraw(double amount) {
    if (amount <= balance) {
      balance -= amount;
      print("\$$amount withdrawn. New balance: \$${balance}");
    } else {
      print("Insufficient balance! Current balance: \$${balance}");
    }
  }

  void showBalance() {
    print("Current balance: \$${balance}");
  }
}

void main() {
  print("Enter account number:");
  int accNum = int.parse(stdin.readLineSync()!);

  print("Enter account holder name:");
  String name = stdin.readLineSync()!;

  print("Enter initial balance:");
  double bal = double.parse(stdin.readLineSync()!);

  BankAccount acc = BankAccount(accNum, name, bal);

  acc.showBalance();


  print("\nEnter amount to deposit:");
  double dep = double.parse(stdin.readLineSync()!);
  acc.deposit(dep);


  print("\nEnter amount to withdraw:");
  double withdr = double.parse(stdin.readLineSync()!);
  acc.withdraw(withdr);


  print("\nFinal balance:");
  acc.showBalance();
}
