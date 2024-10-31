import 'package:ttos/common/constants.dart';

class Bank {
  final String name;
  final String logoImagePath;

  Bank(this.name, String logoImagePath)
      : logoImagePath = '$basePath/bank/$logoImagePath.png';
}
