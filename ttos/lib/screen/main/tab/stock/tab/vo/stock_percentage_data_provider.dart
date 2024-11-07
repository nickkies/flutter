import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/double_extensions.dart';
import 'package:ttos/common/dart/extension/context_extension.dart';

abstract mixin class StockPercentageDataProvider {
  int get currentPrice;
  int get yesterdayClosePrice;

  Color getPriceColor(BuildContext context) => isSame
      ? context.appColors.lessImportant
      : isPlus
          ? context.appColors.plus
          : context.appColors.minus;

  String get todayPercentageString => '$symbol$todayPercentage%';

  double get todayPercentage =>
      ((currentPrice - yesterdayClosePrice) / yesterdayClosePrice * 100)
          .toPrecision(2);

  bool get isSame => currentPrice == yesterdayClosePrice;
  bool get isPlus => currentPrice > yesterdayClosePrice;
  bool get isMinus => currentPrice < yesterdayClosePrice;

  String get symbol => isSame
      ? ''
      : isPlus
          ? '+'
          : '-';
}
