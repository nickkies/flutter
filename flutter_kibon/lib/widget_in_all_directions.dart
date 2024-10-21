import 'package:flutter/material.dart';

class WidgetInAlldirections extends StatelessWidget {
  const WidgetInAlldirections({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('위젯을 상하좌우로 배치')),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: 1300,
            color: Colors.grey,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 300,
                        height: 80,
                        color: Colors.red,
                        child: const Text('Container1'),
                      ),
                      const SizedBox(width: 20),
                      Container(
                        width: 300,
                        height: 80,
                        color: Colors.green,
                        child: const Text('Container2'),
                      ),
                      Container(
                        width: 300,
                        height: 80,
                        color: Colors.blue,
                        child: const Text('Container2'),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.blueGrey,
                  width: 300,
                  height: 1000,
                  child: const Text('Container 4'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
