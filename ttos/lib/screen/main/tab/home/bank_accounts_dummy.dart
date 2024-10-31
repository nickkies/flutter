import 'package:ttos/screen/main/tab/home/banks_dummy.dart';
import 'package:ttos/screen/main/tab/home/vo/vo_bank_account.dart';

final bankAccountShinhan1 = BankAccount(
  bankShinhan,
  3000000,
  accountTypeName: "신한 주거래 우대통장(저축예금)",
);
final bankAccountShinhan2 = BankAccount(
  bankShinhan,
  30000000,
  accountTypeName: "저축예금",
);
final bankAccountShinhan3 = BankAccount(
  bankShinhan,
  300000000,
  accountTypeName: "저축예금",
);
final bankAccountTtos = BankAccount(
  bankTtos,
  5000000,
);
final bankAccountKakao = BankAccount(
  bankKakao,
  7000000,
  accountTypeName: "입출금통장",
);

//Map
final bankMap = {
  "shinhan1": bankAccountShinhan1,
  "shinhan2": bankAccountShinhan2,
};

//Set
final bankSet = {
  bankAccountShinhan1,
  bankAccountShinhan2,
  bankAccountShinhan2,
  bankAccountShinhan2,
  bankAccountShinhan2,
  bankAccountShinhan3,
  bankAccountTtos,
  bankAccountKakao,
};

//List
final bankAccounts = bankSet.toList();
