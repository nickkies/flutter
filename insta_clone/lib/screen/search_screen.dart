import 'dart:math';
import 'package:flutter/material.dart';

class SearchScreeen extends StatelessWidget {
  const SearchScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [SearchTextBar(), SearchGrid()],
        ),
      ),
    );
  }
}

class SearchTextBar extends StatelessWidget {
  const SearchTextBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: TextField(
          cursorColor: Colors.black87,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search),
            hintText: '검색',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.grey.shade200, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.grey.shade100, width: 1),
            ),
            filled: true,
            fillColor: Colors.grey.shade200,
            contentPadding: const EdgeInsets.all(0),
          ),
        ),
      ),
    );
  }
}

class SearchGrid extends StatelessWidget {
  const SearchGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final rd = Random();
    final gridItems = List.generate(30,
        (i) => Colors.primaries[rd.nextInt(Colors.primaries.length)].shade300);

    return GridView.count(
      padding: EdgeInsets.zero,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      crossAxisCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: gridItems.map((e) => Container(color: e)).toList(),
    );
  }
}
