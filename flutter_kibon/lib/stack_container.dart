import 'package:flutter/material.dart';

class StackContainer extends StatelessWidget {
  const StackContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: const Text('쌓기')),
          body: SafeArea(
            child: Stack(
              children: [
                Container(width: 500, height: 500, color: Colors.red),
                Container(width: 400, height: 400, color: Colors.orange),
                Align(
                  alignment: const Alignment(-0.2, 0.3),
                  child:
                      Container(width: 300, height: 300, color: Colors.yellow),
                ),
                Align(
                  alignment: Alignment.center,
                  child:
                      Container(width: 200, height: 200, color: Colors.green),
                ),
                Positioned(
                  left: 110,
                  top: 110,
                  child: Container(width: 100, height: 100, color: Colors.blue),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.purple,
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          const Text(
                            '0',
                            style:
                                TextStyle(color: Colors.purple, fontSize: 24),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
