import 'package:flutter/material.dart';

class FlexContainer extends StatelessWidget {
  const FlexContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: const Text('위젯을 비율로 배치')),
          body: Column(
            children: [
              Container(
                height: 30,
                color: Colors.red,
                margin: const EdgeInsets.symmetric(vertical: 5),
              ),
              Expanded(
                child: Container(
                  color: Colors.red,
                  margin: const EdgeInsets.symmetric(vertical: 5),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  color: Colors.red,
                  margin: const EdgeInsets.symmetric(vertical: 5),
                ),
              ),
              Flexible(
                flex: 2,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(width: 100, height: 100, color: Colors.blue),
                      const SizedBox(height: 5),
                      Container(width: 100, height: 100, color: Colors.blue),
                      const SizedBox(height: 5),
                      Container(width: 100, height: 100, color: Colors.blue),
                      const SizedBox(height: 5),
                      Container(width: 100, height: 100, color: Colors.blue),
                      const SizedBox(height: 5),
                      Container(width: 100, height: 100, color: Colors.blue),
                      const SizedBox(height: 5),
                      Container(width: 100, height: 100, color: Colors.blue),
                      const SizedBox(height: 5),
                      Container(width: 100, height: 100, color: Colors.blue),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
