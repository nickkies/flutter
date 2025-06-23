import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  PageController pageController = PageController();
  int bannerIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 140,
            margin: const EdgeInsets.only(bottom: 8),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                PageView(
                  controller: pageController,
                  onPageChanged: (idx) => setState(() => bannerIndex = idx),
                  children: [
                    Container(
                      color: Colors.white,
                      padding: const EdgeInsets.all(8),
                      child: Image.asset('assets/fastcampus_logo.png'),
                    ),
                    Container(
                      color: Colors.indigo,
                      padding: const EdgeInsets.all(8),
                      child: Image.asset('assets/fastcampus_logo.png'),
                    ),
                    Container(
                      color: Colors.lightGreenAccent,
                      padding: const EdgeInsets.all(8),
                      child: Image.asset('assets/fastcampus_logo.png'),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 8,
                  child: DotsIndicator(
                    dotsCount: 3,
                    position: bannerIndex.toDouble(),
                    onTap: (position) {
                      setState(() => bannerIndex = position.toInt());
                      pageController.animateToPage(
                        position.toInt(),
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeOut,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            margin: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '카테고리',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(onPressed: () {}, child: const Text('더보기')),
                  ],
                ),
                const SizedBox(height: 16),
                // TODO: 카테고리 목록
                Container(height: 200, color: Colors.amber),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 24),
            padding: const EdgeInsets.only(left: 16, top: 8, bottom: 16),
            color: Colors.white,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '오늘의 특가',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(onPressed: () {}, child: const Text('더보기')),
                  ],
                ),
                Container(height: 240, color: Colors.deepPurpleAccent),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
