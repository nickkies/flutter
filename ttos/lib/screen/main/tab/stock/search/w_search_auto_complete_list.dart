import 'package:flutter/material.dart';
import 'package:ttos/common/common.dart';
import 'package:ttos/screen/main/tab/stock/search/search_stock_data.dart';

class SearchAutoCompleteListWidget extends StatelessWidget
    with SearchStockDataProvider {
  SearchAutoCompleteListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, idx) {
        final String stockName = searchData.autoCompleteList[idx].name;

        return Tap(
          onTap: () {
            // stock detail로 이동
          },
          child: stockName.text.make().p(20),
        );
      },
      itemCount: searchData.autoCompleteList.length,
    );
  }
}
