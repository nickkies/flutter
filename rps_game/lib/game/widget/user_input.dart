import 'package:flutter/material.dart';
import 'package:rps_game/game/enum.dart';
import 'package:rps_game/game/widget/input_card.dart';

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
            child: InputCard(child: Image.asset(e.path)),
          ),
        )
        .toList();
  }
}
