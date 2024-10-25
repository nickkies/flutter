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
        Expanded(
          child: GameResult(
            isDone: isDone,
            callback: reset,
            result: getResult(),
          ),
        ),
        Expanded(child: UserInput(isDone: isDone, callback: draw)),
      ],
    );
  }

  static const Map<InputType, Map<InputType, Result>> _results = {
    InputType.rock: {
      InputType.rock: Result.draw,
      InputType.scissors: Result.playerWin,
      InputType.paper: Result.cpuWin,
    },
    InputType.scissors: {
      InputType.rock: Result.cpuWin,
      InputType.scissors: Result.draw,
      InputType.paper: Result.playerWin,
    },
    InputType.paper: {
      InputType.rock: Result.playerWin,
      InputType.scissors: Result.cpuWin,
      InputType.paper: Result.draw,
    }
  };

  Result? getResult() =>
      _userInput == null ? null : _results[_userInput]![_cpuInput];

  void reset() => setState(() => isDone = false);

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
