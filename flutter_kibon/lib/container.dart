import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  const MyContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Container')),
        body: Container(
          width: double.infinity,
          height: 300,
          padding: const EdgeInsets.fromLTRB(10, 20, 15, 15),
          margin: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.limeAccent.shade700,
            border: Border.all(
              color: Colors.indigo,
              width: 5,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              const BoxShadow(
                color: Colors.blueGrey,
                offset: Offset(5, 5),
                blurRadius: 10,
                spreadRadius: 5,
              ),
              BoxShadow(
                color: Colors.yellow.withOpacity(0.3),
                offset: const Offset(-5, -5),
                blurRadius: 10,
                spreadRadius: 5,
              ),
            ],
          ),
          child: const Center(
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
              style: TextStyle(color: Color(0xFF000000)),
            ),
          ),
        ),
      ),
    );
  }
}
