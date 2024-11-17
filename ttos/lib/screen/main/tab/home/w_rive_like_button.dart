import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../../../../common/common.dart';

class RiveLikeButtonWidget extends StatefulWidget {
  final bool isLike;
  final void Function(bool isLike) onTapLike;

  const RiveLikeButtonWidget(
    this.isLike, {
    super.key,
    required this.onTapLike,
  });

  @override
  State<RiveLikeButtonWidget> createState() => _RiveLikeButtonWidgetState();
}

class _RiveLikeButtonWidgetState extends State<RiveLikeButtonWidget> {
  late StateMachineController controller;
  late SMIBool smiPressed;
  late SMIBool smiHover;

  @override
  void didUpdateWidget(covariant RiveLikeButtonWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    bool widgetIsLike = widget.isLike;

    if (oldWidget.isLike == widgetIsLike) return;

    smiPressed.value = widgetIsLike;
    smiHover.value = widgetIsLike;
  }

  @override
  Widget build(BuildContext context) {
    return Tap(
      onTap: () => widget.onTapLike(!widget.isLike),
      child: RiveAnimation.asset(
        '$baseRivePath/light_like.riv',
        stateMachines: const ['State Machine 1'],
        onInit: (Artboard artboard) {
          controller =
              StateMachineController.fromArtboard(artboard, 'State Machine 1')!;
          controller.isActive = true;
          artboard.addController(controller);
          smiPressed = controller.findInput<bool>('Pressed') as SMIBool;
          smiHover = controller.findInput<bool>('Hover') as SMIBool;
        },
      ),
    );
  }
}
