import 'package:flutter/material.dart';
import 'package:ttos/common/common.dart';
import 'package:ttos/screen/main/tab/stock/search/s_stock_detail.dart';
import 'package:ttos/screen/main/tab/stock/search/search_stock_data.dart';

class SearchAutoCompleteListWidget extends StatelessWidget
    with SearchStockDataProvider {
  final TextEditingController controller;
  SearchAutoCompleteListWidget(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, idx) {
        final String stockName = searchData.autoCompleteList[idx].name;

        return Tap(
          onTap: () {
            controller.clear();
            searchData.addHistory(stockName);
            Nav.push(StockDetailScreen(stockName));
          },
          child: stockName.text.make().p(20),
        );
      },
      itemCount: searchData.autoCompleteList.length,
    );
  }
}
