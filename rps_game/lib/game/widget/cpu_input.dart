import 'package:flutter/material.dart';
import 'package:rps_game/game/enum.dart';
import 'package:rps_game/game/widget/input_card.dart';

class CpuInput extends StatelessWidget {
  final bool isDone;

  const CpuInput({required this.isDone, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: SizedBox.shrink()),
        Expanded(child: InputCard(child: _getCpuInput())),
        const Expanded(child: SizedBox.shrink()),
      ],
    );
  }

  Widget _getCpuInput() {
    if (isDone) {
      return Image.asset(InputType.rock.path);
    }

    return const SizedBox(
      height: 80,
      child: Center(
        child: Text(
          '?',
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
