import 'package:flutter/material.dart';
import 'package:ttos/common/common.dart';
import 'package:ttos/screen/main/tab/stock/tab/vo/vo_stock.dart';

class StockItemWidget extends StatelessWidget {
  final Stock stock;
  const StockItemWidget(this.stock, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.backgroundColor,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        children: [
          Image.asset(stock.imagePath, width: 50),
          width20,
          (stock.name).text.size(18).bold.make(),
          emptyExpanded,
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              stock.todayPercentageString.text
                  .color(stock.getPriceColor(context))
                  .make(),
              '${stock.currentPrice.toComma()}원'
                  .text
                  .color(context.appColors.lessImportant)
                  .make(),
            ],
          )
        ],
      ),
    );
  }
}
