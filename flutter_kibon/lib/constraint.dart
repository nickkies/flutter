import 'package:flutter/material.dart';

class MyConstraint extends StatelessWidget {
  const MyConstraint({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('constraint')),
        body: SafeArea(
          child: Container(
            width: 500,
            height: 500,
            color: Colors.lime,
            child: Center(
              child: Container(
                constraints: BoxConstraints.tight(const Size(200, 200)),
                color: Colors.black54,
                padding: const EdgeInsets.all(10),
                child: Container(width: 50, height: 50, color: Colors.cyan),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
