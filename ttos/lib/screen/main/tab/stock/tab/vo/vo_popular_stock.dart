import 'package:ttos/screen/main/tab/stock/tab/vo/vo_simple_stock.dart';

class PopularStock extends SimpleStock {
  final int yesterdayClosePrice;
  final int currentPrice;

  PopularStock({
    required this.yesterdayClosePrice,
    required this.currentPrice,
    required String name,
  }) : super(name);
}
