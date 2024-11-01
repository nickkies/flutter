import 'package:flutter/material.dart';
import 'package:ttos/common/dart/extension/context_extension.dart';

class RoundedContainer extends StatelessWidget {
  final Widget child;
  final double radius;
  final EdgeInsets padding;
  final Color? backgroundColor;

  const RoundedContainer({
    required this.child,
    this.radius = 20,
    this.backgroundColor,
    this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: padding,
        decoration: BoxDecoration(
          color: backgroundColor ?? context.appColors.roundedBackground,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: child);
  }
}
