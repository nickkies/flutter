import 'package:behboolun_meenjoke/model/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Future addCategory(String title) async {
  final db = FirebaseFirestore.instance;
  final ref = db.collection('category');
  await ref.add({'titie': title});
}

// Future<List<Product>> fetchProducts() async {
//   final db = FirebaseFirestore.instance;
//   final res = await db.collection('products').orderBy('timestamp').get();

//   List<Product> items = [];
//   for (var doc in res.docs) {
//     final item = Product.fromJson(doc.data());
//     final realItem = item.copyWith(docId: doc.id);

//     items.add(realItem);
//   }

//   return items;
// }

Stream<QuerySnapshot> streamProducts(String query) {
  final db = FirebaseFirestore.instance;
  if (query.isEmpty) {
    return db.collection('products').orderBy('timestamp').snapshots();
  }

  return db.collection('products').orderBy('title').startAt([query]).endAt([
    '$query\uf8ff',
  ]).snapshots();
}

class SellerWidget extends StatefulWidget {
  const SellerWidget({super.key});

  @override
  State<SellerWidget> createState() => _SellerWidgetState();
}

class _SellerWidgetState extends State<SellerWidget> {
  TextEditingController tec = TextEditingController();

  update(Product? item) async {
    final db = FirebaseFirestore.instance;
    final ref = db.collection('products');

    await ref
        .doc(item?.docId)
        .update(
          item!
              .copyWith(title: 'Updated Title', price: 100, stock: 10)
              .toJson(),
        );
  }

  delete(Product? item) async {
    final db = FirebaseFirestore.instance;

    await db.collection('products').doc(item?.docId).delete();

    final productCategory = await db
        .collection('products')
        .doc(item?.docId)
        .collection('category')
        .get();

    final categoryId = productCategory.docs.first.data()['docId'];

    final p = await db
        .collection('category')
        .doc(categoryId)
        .collection('products')
        .where('docId', isEqualTo: item?.docId)
        .get();

    for (var el in p.docs) {
      el.reference.delete();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchBar(
            controller: tec,
            leading: const Icon(Icons.search),
            hintText: '상품명 입력',
            onChanged: (s) {
              setState(() {});
            },
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () async {
                  List<String> categories = [
                    '정육',
                    '과일',
                    '과자',
                    '견과류',
                    '유제품',
                    '라면',
                    '생수',
                    '빵/쿠키',
                    '아이스크림',
                  ];

                  final ref = FirebaseFirestore.instance.collection('category');
                  final tmp = await ref.get();

                  for (var element in tmp.docs) {
                    await element.reference.delete();
                  }

                  for (String category in categories) {
                    await ref.add({'title': category});
                  }
                },
                child: const Text('카테고리 일괄등록'),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: () {
                  TextEditingController tec = TextEditingController();
                  showAdaptiveDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      content: TextField(controller: tec),
                      actions: [
                        TextButton(
                          onPressed: () async {
                            if (tec.text.isNotEmpty) {
                              await addCategory(tec.text.trim());

                              if (!context.mounted) return;

                              Navigator.of(context).pop();
                            }
                          },
                          child: const Text('등록'),
                        ),
                      ],
                    ),
                  );
                },
                child: const Text('카테고리 등록'),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Text(
              '상품목록',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: StreamBuilder(
              stream: streamProducts(tec.text),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }

                final items = snapshot.data?.docs
                    .map(
                      (e) => Product.fromJson(
                        e.data() as Map<String, dynamic>,
                      ).copyWith(docId: e.id),
                    )
                    .toList();
                return ListView.builder(
                  itemCount: items?.length,
                  itemBuilder: (context, index) {
                    final item = items?[index];

                    return GestureDetector(
                      onTap: () {
                        debugPrint(item?.docId);
                      },
                      child: Container(
                        height: 120,
                        margin: const EdgeInsets.only(bottom: 16),
                        child: Row(
                          children: [
                            Container(
                              width: 120,
                              decoration: BoxDecoration(
                                color: Colors.lightGreenAccent,
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    item?.imgUrl ??
                                        'https://cdn.pixabay.com/photo/2025/06/11/17/18/red-gana-top-9654874_1280.jpg',
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          item?.title ?? '제품명',
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        PopupMenuButton(
                                          icon: const Icon(Icons.more_vert),
                                          itemBuilder: (context) => [
                                            const PopupMenuItem(
                                              child: Text('리뷰'),
                                            ),
                                            PopupMenuItem(
                                              onTap: () => update(item),
                                              child: const Text('수정'),
                                            ),
                                            PopupMenuItem(
                                              onTap: () => delete(item),
                                              child: const Text('삭제'),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Text('${item?.price ?? '-'} 원'),
                                    Text(switch (item?.isSale) {
                                      true => '할인중',
                                      false => '안할인중',
                                      _ => '??',
                                    }),
                                    Text('재고수량: ${item?.stock ?? '0'} 개'),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
