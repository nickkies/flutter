import 'package:flutter/material.dart';
import 'package:ttos/common/common.dart';

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
      children: [
        title.text.bold.make(),
        emptyExpanded,
        Switch(value: isOn, onChanged: onTap)
      ],
    ).p20();
  }
}
