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
  Duration get duration => 10.ms;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() =>
        setState(() => scrollPosition = widget.controller.position.pixels));
  }

  bool get isTriggred => scrollPosition > 80;

  double getValue(double initial, double target) {
    if (isTriggred) return target;

    double fraction = scrollPosition / 80;

    return initial + (target - initial) * fraction;
  }

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
                  left: getValue(20, 50), top: getValue(50, 15)),
              child: AnimatedDefaultTextStyle(
                duration: duration,
                style: TextStyle(
                  fontSize: getValue(30, 18),
                  fontWeight: FontWeight.bold,
                ),
                child: widget.title.text.make(),
              ),
            ),
            Positioned.fill(
                child: Align(
              alignment: Alignment.topRight,
              child: TweenAnimationBuilder<Color?>(
                tween: ColorTween(
                  begin: Colors.green,
                  end: isTriggred ? Colors.orange : Colors.green,
                ),
                duration: 2000.ms,
                builder: (context, value, child) => ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    value ?? Colors.green,
                    BlendMode.modulate,
                  ),
                  child: child,
                ),
                child: Image.asset(
                  '$basePath/icon/map_point.png',
                  height: 60,
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
