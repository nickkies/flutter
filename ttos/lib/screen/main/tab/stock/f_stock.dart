import 'package:flutter/material.dart';
import 'package:ttos/common/common.dart';
import 'package:ttos/common/widget/image_button.dart';
import 'package:ttos/screen/main/tab/stock/search/s_search_stock.dart';
import 'package:ttos/screen/main/tab/stock/setting/s_setting.dart';
import 'package:ttos/screen/main/tab/stock/tab/f_my_stock.dart';
import 'package:ttos/screen/main/tab/stock/tab/f_todays_discovery.dart';

class StockFragment extends StatefulWidget {
  const StockFragment({super.key});

  @override
  State<StockFragment> createState() => _StockFragmentState();
}

class _StockFragmentState extends State<StockFragment>
    with SingleTickerProviderStateMixin {
  late final _tabController = TabController(length: 2, vsync: this);
  int idx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: context.appColors.roundedBackground,
          pinned: true,
          actions: [
            ImageButton(
              imagePath: '$basePath/icon/stock_search.png',
              onTap: () => Nav.push(const SearchStockScreen()),
            ),
            ImageButton(
              imagePath: '$basePath/icon/stock_calendar.png',
              onTap: () => context.showSnackbar('캘린더'),
            ),
            ImageButton(
              imagePath: '$basePath/icon/stock_settings.png',
              onTap: () => Nav.push(const SettingScreen()),
            ),
          ],
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              title,
              height10,
              tabBar,
              idx == 0
                  ? const MyStockFragment()
                  : const TodaysDiscoveryFragment(),
            ],
          ),
        )
      ],
    ));
  }

  Widget get title => Container(
        color: context.appColors.roundedBackground,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            '또스증권'.text.size(24).bold.make(),
            width20,
            'S&P 500'
                .text
                .size(13)
                .bold
                .color(context.appColors.lessImportant)
                .make(),
            width10,
            4000.00
                .toComma()
                .text
                .size(13)
                .bold
                .color(context.appColors.plus)
                .make(),
          ],
        ).pOnly(left: 20),
      );
  Widget get tabBar => Container(
        color: context.appColors.roundedBackground,
        child: Column(
          children: [
            TabBar(
              controller: _tabController,
              indicatorColor: Colors.white,
              labelStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              labelPadding: const EdgeInsets.symmetric(vertical: 20),
              indicatorPadding: const EdgeInsets.symmetric(horizontal: 20),
              tabs: ['내 주식'.text.make(), '오늘의 발견'.text.make()],
              onTap: (i) => setState(() => idx = i),
            ),
            const Line(),
          ],
        ),
      );
}
