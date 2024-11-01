import 'package:flutter/material.dart';
import 'package:ttos/common/dart/extension/context_extension.dart';

class RoundedContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;

  const RoundedContainer({
    required this.child,
    this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: padding,
        decoration: BoxDecoration(
          color: context.appColors.buttonBackground,
          borderRadius: BorderRadius.circular(10),
        ),
        child: child);
  }
}
