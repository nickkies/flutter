import 'package:flutter/material.dart';
import 'package:rps_game/game/enum.dart';

class GameResult extends StatelessWidget {
  final bool isDone;
  final Result? result;
  final VoidCallback callback;

  const GameResult({
    super.key,
    required this.isDone,
    required this.callback,
    this.result,
  });

  @override
  Widget build(BuildContext context) {
    if (isDone) {
      return Column(
        children: [
          Text(result!.displayString, style: const TextStyle(fontSize: 32)),
          const SizedBox(height: 10),
          TextButton(
            onPressed: () => callback.call(),
            child: const Text('다시하기', style: TextStyle(fontSize: 18)),
          )
        ],
      );
    }

    return const Center(
      child: Text(
        '가위~ 바위~ 보!',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}
