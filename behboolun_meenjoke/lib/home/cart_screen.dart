import 'package:behboolun_meenjoke/model/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  final String uid;
  const CartScreen(this.uid, {super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  Stream<QuerySnapshot<Map<String, dynamic>>> steamCartItems() {
    return FirebaseFirestore.instance
        .collection('cart')
        .where('uid', isEqualTo: widget.uid)
        .orderBy('timestamp')
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('장바구니')),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: steamCartItems(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }

                List<Cart> items =
                    snapshot.data?.docs
                        .map(
                          (e) =>
                              Cart.fromJson(e.data()).copyWith(cartDocId: e.id),
                        )
                        .toList() ??
                    [];

                return ListView.separated(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    num price = (item.product?.isSale ?? false)
                        ? ((item.product!.price! *
                                  item.product!.saleRate! /
                                  100)) *
                              (item.count ?? 1)
                        : item.product!.price! * (item.count ?? 1);
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          Container(
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(item.product?.imgUrl ?? ''),
                                fit: BoxFit.cover,
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
                                      Text(item.product!.title!),
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.delete),
                                      ),
                                    ],
                                  ),
                                  Text('${price.toStringAsFixed(0)}원'),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          int count = item.count ?? 1;
                                          if (--count <= 1) {
                                            count = 1;
                                          }

                                          FirebaseFirestore.instance
                                              .collection('cart')
                                              .doc('${item.cartDocId}')
                                              .update({'count': count});
                                        },
                                        icon: const Icon(
                                          Icons.remove_circle_outline,
                                        ),
                                      ),
                                      Text('${item.count ?? 1}'),
                                      IconButton(
                                        onPressed: () {
                                          int count = item.count ?? 1;

                                          if (++count > 99) {
                                            count = 99;
                                          }

                                          FirebaseFirestore.instance
                                              .collection('cart')
                                              .doc(item.cartDocId)
                                              .update({'count': count});
                                        },
                                        icon: const Icon(
                                          Icons.add_circle_outline_outlined,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, _) => const Divider(),
                );
              },
            ),
          ),
          const Divider(),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '합계',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                StreamBuilder(
                  stream: steamCartItems(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Text('0원');
                    }

                    List<Cart> items =
                        snapshot.data?.docs
                            .map(
                              (e) => Cart.fromJson(
                                e.data(),
                              ).copyWith(cartDocId: e.id),
                            )
                            .toList() ??
                        [];

                    double sum = 0;

                    for (Cart item in items) {
                      if (item.product?.isSale ?? false) {
                        sum +=
                            item.product!.price! *
                            (item.product!.saleRate! / 100) *
                            (item.count ?? 1);
                      } else {
                        item.product!.price! * (item.count ?? 1);
                      }
                    }
                    return Text(
                      '${sum.toStringAsFixed(0)}원',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          SafeArea(
            top: false,
            child: Container(
              height: 72,
              // width: double.infinity,
              decoration: BoxDecoration(color: Colors.limeAccent[100]),
              child: const Center(
                child: Text(
                  '배달 주문',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
