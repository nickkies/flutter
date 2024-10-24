import 'package:flutter/material.dart';
import 'package:rps_game/game/enum.dart';

class UserInput extends StatelessWidget {
  final bool isDone;

  const UserInput({required this.isDone, super.key});

  @override
  Widget build(BuildContext context) {
    if (isDone) {
      return const Placeholder();
    }

    return Row(children: _getInputs());
  }

  List<Widget> _getInputs() {
    return InputType.values
        .map(
          (e) => Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: Colors.grey, width: 8),
              ),
              child: Image.asset(e.path),
            ),
          ),
        )
        .toList();
  }
}
