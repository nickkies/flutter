import 'package:flutter/material.dart';

const assetImage = 'assets/images';

class Asset extends StatelessWidget {
  const Asset({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Use Assets')),
        body: Center(
          child: Image.asset('$assetImage/logo.png'),
        ),
      ),
    );
  }
}
