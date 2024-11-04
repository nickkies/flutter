import 'package:flutter/material.dart';
import 'package:ttos/common/common.dart';
import 'package:ttos/common/widget/w_arrow.dart';

class PointButtonWidget extends StatelessWidget {
  final int point;

  const PointButtonWidget({super.key, required this.point});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        '내 포인트'.text.color(context.appColors.lessImportant).make(),
        emptyExpanded,
        '$point 원'.text.bold.make(),
        width10,
        Arrow(color: context.appColors.lessImportant),
      ],
    );
  }
}
