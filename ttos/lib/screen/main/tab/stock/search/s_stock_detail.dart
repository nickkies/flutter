import 'package:flutter/material.dart';
import 'package:ttos/common/common.dart';

class StockDetailScreen extends StatelessWidget {
  final String stockName;

  const StockDetailScreen(this.stockName, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: stockName.text.make()),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          '주식 상세'.text.make(),
        ],
      ).p(20),
    );
  }
}
