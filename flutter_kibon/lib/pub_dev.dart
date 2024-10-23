import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class PubDev extends StatelessWidget {
  const PubDev({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: SafeArea(
            child: Scaffold(
      appBar: AppBar(title: const Text('외부 라이브러리 활용')),
      body: const RandomWords(),
    )));
  }
}

class RandomWords extends StatelessWidget {
  const RandomWords({super.key});

  @override
  Widget build(BuildContext context) {
    final wordList = generateWordPairs().take(5).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: wordList
          .map(
            (word) => Text(
              word.asPascalCase,
              style: const TextStyle(fontSize: 24),
            ),
          )
          .toList(),
    );
  }
}
