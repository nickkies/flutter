import 'package:ttos/common/constants.dart';
import 'package:ttos/screen/main/tab/stock/tab/vo/vo_popular_stock.dart';

class Stock extends PopularStock {
  final String imagePath;

  Stock({
    required imagePath,
    required super.name,
    required super.currentPrice,
    required super.yesterdayClosePrice,
  }) : imagePath = '$basePath/stock/$imagePath.png';
}
