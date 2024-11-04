import 'package:flutter/material.dart';
import 'package:ttos/common/common.dart';
import 'package:ttos/screen/main/tab/benefit/vo_benefit.dart';

class BenefitItemWidget extends StatelessWidget {
  final Benefit benefit;
  const BenefitItemWidget({super.key, required this.benefit});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(benefit.imagePath, width: 50, height: 50),
        width10,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            benefit.title.text.size(13).make(),
            height5,
            benefit.subTitle.text
                .color(context.appColors.blueText)
                .size(13)
                .make(),
          ],
        ),
      ],
    ).pSymmetric(v: 10);
  }
}
