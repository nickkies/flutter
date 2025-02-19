import 'package:flutter/material.dart';
import 'package:todo/src/data/memory/todo_data_holder.dart';
import 'package:todo/src/main/tab/search/f_search.dart';
import 'package:todo/src/main/tab/todo/f_todo.dart';

import '../settings/settings_view.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  static const routeName = '/';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIdx = 0;

  final List<Widget> _pages = [
    const TodoFragment(),
    const SearchFragment(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TODO'), actions: [
        IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () {
            Navigator.restorablePushNamed(context, SettingsView.routeName);
          },
        ),
      ]),
      body: _pages[_selectedIdx],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.holder.addTodo(context);
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIdx,
          onTap: (idx) {
            setState(() => _selectedIdx = idx);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.event_note_outlined),
              label: 'TODO',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            )
          ]),
    );
  }
}
