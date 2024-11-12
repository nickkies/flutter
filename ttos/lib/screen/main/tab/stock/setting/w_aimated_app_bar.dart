import 'package:flutter/material.dart';
import 'package:ttos/common/common.dart';
import 'package:ttos/common/widget/w_arrow.dart';

class AnimatedAppBar extends StatefulWidget {
  final ScrollController controller;
  final String title;

  const AnimatedAppBar(this.title, {super.key, required this.controller});

  @override
  State<AnimatedAppBar> createState() => _AnimatedAppBarState();
}

class _AnimatedAppBarState extends State<AnimatedAppBar> {
  double scrollPosition = 0;
  final Duration duration = 250.ms;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() =>
        setState(() => scrollPosition = widget.controller.position.pixels));
  }

  bool get isTriggred => scrollPosition > 80;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: context.backgroundColor,
      child: SafeArea(
        child: Stack(
          children: [
            Tap(
              onTap: () => Nav.pop(context),
              child: const Arrow(
                direction: AxisDirection.left,
              ),
            ).p20(),
            AnimatedContainer(
              duration: duration,
              padding: EdgeInsets.only(
                  left: isTriggred ? 50 : 20, top: isTriggred ? 15 : 50),
              child: AnimatedDefaultTextStyle(
                duration: duration,
                style: TextStyle(
                    fontSize: isTriggred ? 18 : 30,
                    fontWeight: FontWeight.bold),
                child: widget.title.text.make(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
