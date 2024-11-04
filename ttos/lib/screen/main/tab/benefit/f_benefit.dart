import 'package:flutter/material.dart';
import 'package:ttos/common/common.dart';
import 'package:ttos/screen/main/s_main.dart';
import 'package:ttos/screen/main/tab/benefit/benefits_dummy.dart';
import 'package:ttos/screen/main/tab/benefit/w_benefit_item.dart';
import 'package:ttos/screen/main/tab/benefit/w_point_button.dart';

class BenefitFragment extends StatefulWidget {
  const BenefitFragment({super.key});

  @override
  State<BenefitFragment> createState() => _BenefitFragmentState();
}

class _BenefitFragmentState extends State<BenefitFragment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
            bottom: MainScreenState.bottomNavigatorHeight),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            height30,
            '혜택'.text.white.bold.size(18).make(),
            height30,
            const PointButtonWidget(point: 486),
            height20,
            '혜택 더받기'.text.white.bold.size(16).make(),
            height10,
            ...benefits.map((e) => BenefitItemWidget(benefit: e)).toList(),
          ],
        ).pSymmetric(h: 20),
      ),
    );
  }
}
