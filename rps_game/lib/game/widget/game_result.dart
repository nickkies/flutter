import 'package:flutter/material.dart';

class GameResult extends StatelessWidget {
  final bool isDone;

  const GameResult({required this.isDone, super.key});

  @override
  Widget build(BuildContext context) {
    if (isDone) {
      return Column(
        children: [
          const Text('승리!', style: TextStyle(fontSize: 32)),
          const SizedBox(height: 10),
          TextButton(
            onPressed: () {},
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
