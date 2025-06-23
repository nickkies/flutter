import 'package:behboolun_meenjoke/home/widgets/home_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _menuIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('배부른 민족'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.logout)),
        ],
      ),
      body: IndexedStack(
        index: _menuIndex,
        children: [
          const HomeWidget(),
          Container(color: Colors.greenAccent),
        ],
      ),
      floatingActionButton: switch (_menuIndex) {
        0 => FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.shopping_cart_outlined),
        ),
        1 => FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
        _ => Container(),
      },
      bottomNavigationBar: NavigationBar(
        selectedIndex: _menuIndex,
        onDestinationSelected: (idx) => setState(() => _menuIndex = idx),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.store_outlined), label: '홈'),
          NavigationDestination(
            icon: Icon(Icons.storefront),
            label: '사장님(판매자)',
          ),
        ],
      ),
    );
  }
}
