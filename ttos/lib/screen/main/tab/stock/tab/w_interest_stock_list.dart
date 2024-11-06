import 'package:flutter/material.dart';
import 'package:ttos/screen/main/tab/stock/tab/dummy_interest_stocks.dart';
import 'package:ttos/screen/main/tab/stock/tab/w_stock_item.dart';

class InterestStockListWidget extends StatelessWidget {
  const InterestStockListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [...myInterestStocks.map((e) => StockItemWidget(e)).toList()],
    );
  }
}
