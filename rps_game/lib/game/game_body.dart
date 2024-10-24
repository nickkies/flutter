import 'package:flutter/material.dart';

import 'package:rps_game/game/cpu_input.dart';
import 'package:rps_game/game/game_result.dart';
import 'package:rps_game/game/user_input.dart';

class GameBody extends StatefulWidget {
  const GameBody({super.key});

  @override
  State<GameBody> createState() => _GameBodyState();
}

class _GameBodyState extends State<GameBody> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Expanded(child: CpuInput()),
        Expanded(child: GameResult()),
        Expanded(child: UserInput()),
      ],
    );
  }
}
