import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ttos/common/common.dart';
import 'package:ttos/screen/main/tab/stock/search/s_stock_detail.dart';
import 'package:ttos/screen/main/tab/stock/search/search_stock_data.dart';

class SearchHistoryStockListWidget extends StatefulWidget {
  const SearchHistoryStockListWidget({super.key});

  @override
  State<SearchHistoryStockListWidget> createState() =>
      _SearchHistoryStockListWidgetState();
}

class _SearchHistoryStockListWidgetState
    extends State<SearchHistoryStockListWidget> with SearchStockDataProvider {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 65,
        child: Obx(
          () => ListView.builder(
            padding: const EdgeInsets.only(top: 5),
            scrollDirection: Axis.horizontal,
            itemCount: searchData.searchHistoryList.length,
            itemBuilder: (ctx, idx) {
              final String stockName = searchData.searchHistoryList[idx];

              return Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 8),
                    child: Row(
                      children: [
                        Tap(
                          onTap: () => Nav.push(StockDetailScreen(stockName)),
                          child: stockName.text.make(),
                        ),
                        Tap(
                          onTap: () => searchData.removeHistory(stockName),
                          child: const Icon(Icons.close),
                        ),
                      ],
                    )
                        .box
                        .withRounded(value: 6)
                        .color(context.appColors.roundedBackground)
                        .p8
                        .make(),
                  ),
                ],
              );
            },
          ),
        ));
  }
}
