import 'package:flutter/material.dart';

class WidgetInAlldirections extends StatelessWidget {
  const WidgetInAlldirections({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('위젯을 상하좌우로 배치')),
        body: Container(
          width: double.infinity,
          height: 300,
          color: Colors.grey,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 100,
                height: 80,
                color: Colors.red,
                child: const Text('Container1'),
              ),
              Container(
                width: 100,
                height: 80,
                color: Colors.green,
                child: const Text('Container2'),
              ),
              Container(
                width: 100,
                height: 80,
                color: Colors.blue,
                child: const Text('Container2'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
