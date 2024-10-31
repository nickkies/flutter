import 'package:ttos/screen/main/tab/home/vo/vo_bank.dart';

class BankAccount {
  final Bank bank;
  final String accountNumber;
  final String accountHolder;
  final String? accountTypeName;
  int balance;

  BankAccount(
    this.bank,
    this.accountNumber,
    this.accountHolder,
    this.balance, {
    this.accountTypeName,
  });
}
