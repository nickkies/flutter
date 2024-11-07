import 'package:flutter/material.dart';
import 'package:ttos/common/common.dart';
import 'package:ttos/common/dart/extension/datetime_extension.dart';
import 'package:ttos/screen/main/tab/stock/search/dummy_popular_stocks.dart';
import 'package:ttos/screen/main/tab/stock/search/w_popular_stock_item.dart';

class PopularSearchStockListWidget extends StatelessWidget {
  const PopularSearchStockListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            '인기 검색'.text.bold.make(),
            '오늘 ${DateTime.now().formattedTime} 기준'
                .text
                .color(context.appColors.lessImportant)
                .size(12)
                .make(),
          ],
        ),
        height20,
        ...popularStocks
            .mapIndexed((e, i) => PopularStockItemWidget(e, ++i))
            .toList(),
      ],
    ).p(20);
  }
}
