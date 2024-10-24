import 'package:flutter/material.dart';

class GameResult extends StatelessWidget {
  final bool isDone;

  const GameResult({required this.isDone, super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('GameResult');
  }
}
