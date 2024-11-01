import 'package:flutter/material.dart';
import 'package:ttos/common/common.dart';

class TtosAppBar extends StatefulWidget {
  const TtosAppBar({super.key});

  @override
  State<TtosAppBar> createState() => _TtosAppBarState();
}

class _TtosAppBarState extends State<TtosAppBar> {
  bool _showRedDot = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: context.appColors.appBarBackground,
      child: Row(
        children: [
          width10,
          Image.asset('$basePath/icon/toss.png', height: 30),
          emptyExpanded,
          Image.asset('$basePath/icon/map_point.png', height: 30),
          width10,
          Stack(
            children: [
              Image.asset('$basePath/icon/notification.png', height: 30),
              if (_showRedDot)
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                    ),
                  ),
                )
            ],
          ),
          width10,
        ],
      ),
    );
  }
}
