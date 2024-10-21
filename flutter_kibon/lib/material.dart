import 'package:flutter/material.dart';

class MyMaterialApp extends StatelessWidget {
  const MyMaterialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                print('홈 눌림');
              },
            ),
            const Icon(Icons.play_arrow),
          ],
          centerTitle: true,
          backgroundColor: Colors.black87,
          title: const Text(
            'app bar',
            style: TextStyle(
              color: Colors.white70,
            ),
          ),
        ),
        body: const Center(
          child: Text(
            'Hi, there',
            style: TextStyle(
              fontSize: 40,
              color: Colors.black,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.bug_report),
          onPressed: () {
            print('버그 리포트 눌림');
          },
        ),
      ),
    );
  }
}
