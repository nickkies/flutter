import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rps_game/game/enum.dart';

import 'package:rps_game/game/widget/cpu_input.dart';
import 'package:rps_game/game/widget/game_result.dart';
import 'package:rps_game/game/widget/user_input.dart';

class GameBody extends StatefulWidget {
  const GameBody({super.key});

  @override
  State<GameBody> createState() => _GameBodyState();
}

class _GameBodyState extends State<GameBody> {
  late bool isDone;
  InputType? _userInput;
  InputType? _cpuInput;

  @override
  void initState() {
    super.initState();
    isDone = false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: CpuInput(isDone: isDone, cpuInput: _cpuInput)),
        Expanded(child: GameResult(isDone: isDone)),
        Expanded(child: UserInput(isDone: isDone, callback: draw)),
      ],
    );
  }

  void draw(InputType userInput) {
    setState(() {
      // Generate and set cpu input
      final rd = Random();
      setState(() => _cpuInput = InputType.values[rd.nextInt(3)]);

      // Set user input
      _userInput = userInput;

      // Switch to result mode
      isDone = true;
    });
  }
}
