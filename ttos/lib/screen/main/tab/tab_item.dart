import 'package:flutter/material.dart';

import 'package:ttos/common/common.dart';
import 'package:ttos/screen/main/tab/all/f_all.dart';
import 'package:ttos/screen/main/tab/benefit/f_benefit.dart';
import 'package:ttos/screen/main/tab/home/f_home.dart';
import 'package:ttos/screen/main/tab/stock/f_stock.dart';
import 'package:ttos/screen/main/tab/ttos_pay/f_ttos_pay.dart';

enum TabItem {
  home(Icons.home, '홈', HomeFragment()),
  benefit(Icons.star, '혜택', BenefitFragment()),
  ttosPay(Icons.payment, '토스페이', TtosPayFragment()),
  stock(Icons.stacked_line_chart, '주식', StockFragment()),
  all(Icons.menu, '전체', AllFragment());

  final IconData activeIcon;
  final IconData inActiveIcon;
  final String tabName;
  final Widget firstPage;

  const TabItem(this.activeIcon, this.tabName, this.firstPage,
      {IconData? inActiveIcon})
      : inActiveIcon = inActiveIcon ?? activeIcon;

  BottomNavigationBarItem toNavigationBarItem(BuildContext context,
      {required bool isActivated}) {
    return BottomNavigationBarItem(
        icon: Icon(
          key: ValueKey(tabName),
          isActivated ? activeIcon : inActiveIcon,
          color: isActivated
              ? context.appColors.iconButton
              : context.appColors.iconButtonInactivate,
        ),
        label: tabName);
  }
}
