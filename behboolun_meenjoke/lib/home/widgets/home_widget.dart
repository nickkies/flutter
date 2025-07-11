import 'package:behboolun_meenjoke/model/category.dart';
import 'package:behboolun_meenjoke/model/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  PageController pageController = PageController();
  int bannerIndex = 0;

  Stream<QuerySnapshot<Map<String, dynamic>>> streamCategories() {
    return FirebaseFirestore.instance.collection('category').snapshots();
  }

  List<Category> categoryItems = [];

  Future<List<Product>> fetchSaleProducts() async {
    final dbRef = FirebaseFirestore.instance.collection('products');
    final saleItems = await dbRef
        .where('isSale', isEqualTo: true)
        .orderBy('saleRate')
        .get();

    List<Product> products = [];

    for (var item in saleItems.docs) {
      final saleItem = Product.fromJson(item.data()).copyWith(docId: item.id);
      products.add(saleItem);
    }

    return products;
  }

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
                SizedBox(
                  height: 200,
                  child: StreamBuilder(
                    stream: streamCategories(),
                    builder: (BuildContext context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(
                          child: CircularProgressIndicator.adaptive(),
                        );
                      }
                      categoryItems.clear();
                      final docs = snapshot.data;
                      final docItems = docs?.docs ?? [];

                      for (var doc in docItems) {
                        categoryItems.add(
                          Category(docId: doc.id, title: doc.data()['title']),
                        );
                      }

                      return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                            ),
                        itemCount: categoryItems.length,
                        itemBuilder: (context, idx) {
                          final item = categoryItems[idx];

                          return Column(
                            children: [
                              const CircleAvatar(radius: 24),
                              const SizedBox(height: 8),
                              Text(
                                item.title ?? '',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
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
                SizedBox(
                  height: 240,
                  child: FutureBuilder(
                    future: fetchSaleProducts(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(
                          child: CircularProgressIndicator.adaptive(),
                        );
                      }

                      final items = snapshot.data ?? [];

                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          final item = items[index];

                          return GestureDetector(
                            onTap: () {
                              context.go('/product', extra: item);

                              // Navigator.of(context).push(
                              //   MaterialPageRoute(
                              //     builder: (context) =>
                              //         const ProductDetailScreen(),
                              //   ),
                              // );
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Container(
                                    width: 160,
                                    margin: const EdgeInsets.only(right: 16),
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(8),
                                      image: DecorationImage(
                                        image: NetworkImage(item.imgUrl ?? ''),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  item.title ?? '',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  '${item.price} 원',
                                  style: const TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                                Text(
                                  '${(item.price! * (item.saleRate! / 100)).toStringAsFixed(0)} 원',
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
