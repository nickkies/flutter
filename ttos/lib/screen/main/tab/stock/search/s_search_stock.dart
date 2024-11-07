import 'package:flutter/material.dart';
import 'package:ttos/screen/main/tab/stock/search/w_popular_search_stock_list.dart';
import 'package:ttos/screen/main/tab/stock/search/w_search_history_stock_list.dart';
import 'package:ttos/screen/main/tab/stock/search/w_stock_search.dart';

class SearchStockScreen extends StatefulWidget {
  const SearchStockScreen({super.key});

  @override
  State<SearchStockScreen> createState() => _SearchStockScreenState();
}

class _SearchStockScreenState extends State<SearchStockScreen> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StockSearchAppBarWidget(controller: controller),
      body: ListView(
        children: const [
          SearchHistoryStockListWidget(),
          PopularSearchStockListWidget()
        ],
      ),
    );
  }
}
