import 'package:behboolun_meenjoke/main.dart';
import 'package:behboolun_meenjoke/model/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;

  const ProductDetailScreen(this.product, {super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${widget.product.title}')),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 320,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(widget.product.imgUrl ?? ''),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          switch (widget.product.isSale) {
                            true => Container(
                              decoration: const BoxDecoration(
                                color: Colors.pinkAccent,
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 12,
                              ),
                              child: const Text(
                                '할인 중',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            _ => Container(),
                          },
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.product.title!,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            PopupMenuButton(
                              icon: const Icon(Icons.more_vert),
                              itemBuilder: (context) => [
                                PopupMenuItem(
                                  onTap: () {
                                    int reviewScore = 0;

                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        TextEditingController reviewTEC =
                                            TextEditingController();

                                        return StatefulBuilder(
                                          builder: (context, setState) {
                                            return AlertDialog(
                                              title: const Text('리뷰 등록'),
                                              content: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  TextField(
                                                    controller: reviewTEC,
                                                  ),
                                                  Row(
                                                    children: List.generate(
                                                      5,
                                                      (index) => IconButton(
                                                        onPressed: () =>
                                                            setState(
                                                              () =>
                                                                  reviewScore =
                                                                      index,
                                                            ),
                                                        icon: Icon(
                                                          Icons.star,
                                                          color:
                                                              index <=
                                                                  reviewScore
                                                              ? Colors
                                                                    .amberAccent
                                                              : Colors.grey,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              actions: [
                                                TextButton(
                                                  onPressed: () => Navigator.of(
                                                    context,
                                                  ).pop(),
                                                  child: const Text('취소'),
                                                ),
                                                TextButton(
                                                  onPressed: () {},
                                                  child: const Text('등록'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                    );
                                  },
                                  child: const Text('리뷰등록'),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Text('제품 상세 정보'),
                        Text(widget.product.description ?? ''),
                        Row(
                          children: [
                            Text(
                              '${(widget.product.price! * (widget.product.saleRate ?? 0) / 100).toStringAsFixed(0)}원',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            const Icon(Icons.star, color: Colors.amberAccent),
                            const Text('4.5'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  DefaultTabController(
                    length: 2,
                    child: Column(
                      children: [
                        const TabBar(
                          tabs: [
                            Tab(text: '제품 상세'),
                            Tab(text: '리뷰'),
                          ],
                        ),
                        SizedBox(
                          height: 500,
                          child: TabBarView(
                            children: [
                              Container(child: const Text('제품 상세')),
                              Container(child: const Text('리뷰')),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              final db = FirebaseFirestore.instance;
              final dupItems = await db
                  .collection('cart')
                  .where('uid', isEqualTo: userCredential?.user?.uid ?? '')
                  .where('product.docId', isEqualTo: widget.product.docId)
                  .get();

              if (dupItems.docs.isNotEmpty) {
                if (context.mounted) {
                  showDialog(
                    context: context,
                    builder: (constext) => const AlertDialog(
                      content: Text('장바구니에 이미 등록되어 있는 제품입니다.'),
                    ),
                  );
                }
                return;
              }

              await db.collection('cart').add({
                'uid': userCredential?.user?.uid,
                'email': userCredential?.user?.email,
                'timestamp': DateTime.now().microsecondsSinceEpoch,
                'product': widget.product.toJson(),
                'count': 1,
              });

              if (context.mounted) {
                showDialog(
                  context: context,
                  builder: (context) =>
                      const AlertDialog(content: Text('장바구니에 등록되었습니다.')),
                );
              }
            },
            child: SafeArea(
              top: false,
              child: Container(
                height: 72,
                decoration: BoxDecoration(color: Colors.red[100]),
                child: const Center(
                  child: Text(
                    '장바구니',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
