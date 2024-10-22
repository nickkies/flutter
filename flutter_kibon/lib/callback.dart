import 'package:flutter/material.dart';

class MyCallback extends StatelessWidget {
  const MyCallback({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(title: const Text('Callback')),
          body: const MyWidget(),
        ),
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  late int cnt;

  @override
  void initState() {
    super.initState();
    cnt = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Count: $cnt', style: const TextStyle(fontSize: 32)),
          // MyBtn(() => setState(() => ++cnt)),
          MyBtn((int val) => setState(() => cnt += val)),
        ],
      ),
    );
  }

  void addCnt(int val) => setState(() => cnt += val);
}

class MyBtn extends StatelessWidget {
  const MyBtn(this.callback, {super.key});

  // final VoidCallback callback;
  final Function(int) callback;

  @override
  Widget build(BuildContext context) {
    // return InkWell(
    return GestureDetector(
      // onTap: () => callback.call(),
      onTap: () => callback.call(1),
      onDoubleTap: () => callback.call(4),
      onLongPress: () => callback.call(100),
      child: Container(
        width: 90,
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Center(child: Text('Add count')),
      ),
    );
  }
}
