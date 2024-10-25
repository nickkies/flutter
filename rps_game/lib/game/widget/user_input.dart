import 'package:flutter/material.dart';
import 'package:rps_game/game/enum.dart';
import 'package:rps_game/game/widget/input_card.dart';

class UserInput extends StatelessWidget {
  final bool isDone;
  final InputType? userInput;
  final Function(InputType) callback;

  const UserInput({
    this.userInput,
    required this.callback,
    required this.isDone,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (isDone) {
      return Row(
        children: [
          const Expanded(child: SizedBox.shrink()),
          Expanded(child: InputCard(child: Image.asset(userInput!.path))),
          const Expanded(child: SizedBox.shrink()),
        ],
      );
    }

    return Row(children: _getInputs());
  }

  List<Widget> _getInputs() {
    return InputType.values
        .map(
          (e) => Expanded(
            child: InkWell(
              onTap: () => callback.call(e),
              child: InputCard(child: Image.asset(e.path)),
            ),
          ),
        )
        .toList();
  }
}
