import 'package:flutter/material.dart';
import 'package:rps_game/game/game_body.dart';

void main() {
  runApp(const RpsApp());
}

class RpsApp extends StatelessWidget {
  const RpsApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RPS GAME',
      home: Scaffold(
        appBar: AppBar(title: const Text('RPS GAME')),
        body: const GameBody(),
      ),
    );
  }
}
