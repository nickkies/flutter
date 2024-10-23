import 'package:flutter/material.dart';

class MyRoute extends StatelessWidget {
  const MyRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomeWidget());
  }
}

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _BodyState();
}

class _BodyState extends State<HomeWidget> {
  late int idx;

  @override
  void initState() {
    super.initState();
    idx = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('페이지가 이동하는 것 처럼 보이기')),
      body: homeBody(),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Person'),
        ],
        currentIndex: idx,
        onTap: (val) => setState(() => idx = val),
      ),
    );
  }

  Widget homeBody() {
    switch (idx) {
      case 1:
        return const Center(child: Icon(Icons.search, size: 100));
      case 2:
        return const Center(child: Icon(Icons.person, size: 100));
      case 0:
      default:
        return const Center(child: Icon(Icons.home, size: 100));
    }
  }
}
