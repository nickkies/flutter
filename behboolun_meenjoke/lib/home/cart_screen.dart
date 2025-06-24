import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  String uid;
  CartScreen(this.uid, {super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('장바구니')),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('flutter flutter'),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.delete),
                                ),
                              ],
                            ),
                            const Text('100,000원'),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.remove_circle_outline),
                                ),
                                const Text('12'),
                                IconButton(
                                  onPressed: () {},
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
              ),
              separatorBuilder: (context, _) => const Divider(),
              itemCount: 10,
            ),
          ),
          const Divider(),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '합계',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  '100,000,000원',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
