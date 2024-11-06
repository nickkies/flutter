import 'package:flutter/material.dart';
import 'package:ttos/common/common.dart';
import 'package:ttos/common/widget/long_button.dart';
import 'package:ttos/common/widget/w_arrow.dart';
import 'package:ttos/common/widget/w_rounded_container.dart';
import 'package:ttos/screen/main/tab/stock/tab/w_interest_stock_list.dart';

class MyStockFragment extends StatelessWidget {
  const MyStockFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        myAccount(context),
        height20,
        myStock(context),
      ],
    );
  }

  Widget myAccount(BuildContext context) => Container(
        color: context.appColors.roundedBackground,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            height20,
            '계좌'.text.make(),
            Row(
              children: [
                '500원'.text.size(24).bold.make(),
                const Arrow(),
                emptyExpanded,
                RoundedContainer(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  backgroundColor: context.appColors.buttonBackground,
                  radius: 8,
                  child: '채우기'.text.size(12).make(),
                ),
              ],
            ),
            height30,
            Line(color: context.appColors.divider),
            height10,
            const LongButton(title: '주문내역'),
            const LongButton(title: '판매수익'),
          ],
        ).pSymmetric(h: 20),
      );

  Widget myStock(BuildContext context) => Column(
        children: [
          Container(
            color: context.appColors.roundedBackground,
            child: Column(
              children: [
                height30,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    '관심주식'.text.make(),
                    '편집하기'
                        .text
                        .bold
                        .color(context.appColors.lessImportant)
                        .make(),
                  ],
                ),
                height20,
                Tap(
                  onTap: () => context.showSnackbar('기본'),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      '기본'.text.make(),
                      const Arrow(direction: AxisDirection.up),
                    ],
                  ).pOnly(bottom: 20),
                ),
              ],
            ).pSymmetric(h: 20),
          ),
          const InterestStockListWidget(),
        ],
      );
}
