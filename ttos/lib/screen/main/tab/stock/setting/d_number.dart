import 'package:flutter/material.dart';
import 'package:nav/dialog/dialog.dart';
import 'package:ttos/common/common.dart';
import 'package:ttos/common/widget/w_round_button.dart';
import 'package:ttos/common/widget/w_rounded_container.dart';

class NumberDialog extends DialogWidget<int> {
  NumberDialog({
    super.key,
    super.animation = NavAni.Fade,
    super.barrierDismissible = false,
  });

  @override
  State<NumberDialog> createState() => _NumberDialogState();
}

class _NumberDialogState extends DialogState<NumberDialog> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: RoundedContainer(
        child: Column(
          children: [
            '숫자를 입력해주세요.'.text.make(),
            TextField(
              controller: controller,
              keyboardType: TextInputType.number,
            ),
            RoundButton(
              text: '완료',
              onTap: () => widget.hide(int.parse(controller.text)),
            ),
          ],
        ),
      ),
    );
  }
}
