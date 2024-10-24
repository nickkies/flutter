import 'package:flutter/material.dart';
import 'package:rps_game/game/enum.dart';
import 'package:rps_game/game/widget/input_card.dart';

class CpuInput extends StatelessWidget {
  final bool isDone;
  final InputType? cpuInput;

  const CpuInput({super.key, required this.isDone, this.cpuInput});

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
      return Image.asset(cpuInput!.path);
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
