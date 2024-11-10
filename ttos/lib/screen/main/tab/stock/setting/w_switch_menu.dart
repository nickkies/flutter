import 'package:flutter/material.dart';
import 'package:ttos/common/common.dart';
import 'package:ttos/screen/main/tab/stock/setting/w_os_switch.dart';

class SwitchMenuWidget extends StatelessWidget {
  final String title;
  final bool isOn;
  // final void Function(bool isOn) onTap;
  final ValueChanged<bool> onTap;

  const SwitchMenuWidget(
    this.title,
    this.isOn, {
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        title.text.bold.make(),
        OsSwtichWidget(value: isOn, onChanged: onTap)
      ],
    ).p20();
  }
}
