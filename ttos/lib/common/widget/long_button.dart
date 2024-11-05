import 'package:flutter/material.dart';
import 'package:ttos/common/common.dart';
import 'package:ttos/common/widget/w_arrow.dart';

class LongButton extends StatelessWidget {
  final String title;
  final VoidCallback? onTab;

  const LongButton({super.key, required this.title, this.onTab});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        title.text.make(),
        emptyExpanded,
        Arrow(color: context.appColors.lessImportant),
      ],
    ).pSymmetric(v: 15);
  }
}
