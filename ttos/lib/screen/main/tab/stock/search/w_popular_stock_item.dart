import 'package:flutter/material.dart';
import 'package:ttos/screen/main/tab/stock/tab/vo/vo_popular_stock.dart';
import 'package:ttos/common/common.dart';

class PopularStockItemWidget extends StatelessWidget {
  final PopularStock stock;
  final int idx;

  const PopularStockItemWidget(this.stock, this.idx, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 60,
          child: idx.text.make(),
        ),
        width20,
        stock.name.text.make(),
        emptyExpanded,
        stock.todayPercentageString.text
            .color(stock.getPriceColor(context))
            .make(),
      ],
    ).pSymmetric(v: 10);
  }
}
