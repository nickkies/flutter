import 'package:flutter/material.dart';

class MyState extends StatelessWidget {
  const MyState({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('State Management')),
        body: const Column(
          children: [
            Expanded(child: StateLess()),
            Expanded(child: Stateful(cnt: 5)),
          ],
        ),
      ),
    );
  }
}

// stateless
class StateLess extends StatelessWidget {
  const StateLess({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.red);
  }
}

// stateful
class Stateful extends StatefulWidget {
  final int cnt;

  const Stateful({required this.cnt, super.key});

  @override
  State<Stateful> createState() => _StatefulState();
}

class _StatefulState extends State<Stateful> {
  late int _cnt;
  late TextEditingController tec;

  @override
  void initState() {
    super.initState();
    _cnt = widget.cnt;
    tec = TextEditingController();
  }

  /// 할당 해제해야함
  @override
  void dispose() {
    tec.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (_cnt++ == 5) _cnt = 0;
        });
      },
      child: Container(
        color: Colors.blue.withOpacity(_cnt / 5),
        child: Center(
          child: Text(
            '$_cnt',
            style: const TextStyle(fontSize: 34),
          ),
        ),
      ),
    );
  }
}
